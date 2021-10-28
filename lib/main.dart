import 'package:flutter/material.dart';
import 'package:myfirstapp/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/homepage': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  dynamic _selectedGender = 'Male';
  bool _hasValue = false;
  final successSnackBar = SnackBar(
    content: const Text('You have logged in!'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Center(
          child: Text(
            'Welcome Screen',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              onChanged: () {
                // setState
              },
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image(
                        image: NetworkImage(
                            'https://media.istockphoto.com/photos/on-colourful-speech-bubbles-picture-id180819641?b=1&k=20&m=180819641&s=170667a&w=0&h=CX51cRVofQl95e_cu9Bfy5PLZQ1WdsqmJ-NCFzU96UI='),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (String? value) {
                        checkInput();
                        setState(() {});
                      }),
                  TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your e-mail",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (String? value) {
                        checkInput();
                        setState(() {});
                      }),
                  TextField(
                      autocorrect: false,
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (String? value) {
                        checkInput();
                        setState(() {});
                      }),
                  Divider(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.blueGrey,
                        width: 1,
                      )),
                      child: DropdownButton<String>(
                        value: _selectedGender,
                        hint: Text(
                          'Select your gender',
                        ),
                        items: <String>['Female', 'Male', 'Other']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: _hasValue ? Colors.blue : Colors.grey,
                    ),
                    child: TextButton(
                      onPressed: _hasValue
                          ? () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(successSnackBar);
                              // Navigator.popAndPushNamed(context, '/homepage');
                            }
                          : () {
                              print('Please input in all 3 textfields');
                            },
                      child: Text(
                        'Sign-up',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _save() async {
    // Saves user input locally
  }

  checkInput() {
    if (passwordController.text == '' ||
        nameController.text == '' ||
        emailController.text == '') {
      _hasValue = false;
    } else {
      _hasValue = true;
    }
  }
}
