import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:employee_project/EmployeeView.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  final usernameController = TextEditingController();
  final usernamePasswordController = TextEditingController();
  bool usernameError = false;
  bool usernamepassError = false;
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 749,
            height: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 0.58),
            child: Column(
              children: [
                SizedBox(
                  height: 320,
                ),
                Row(
                  children: [
                    SizedBox(width: 150),
                    Container(
                      child: Text(
                        "Welcome to",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.5,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "  TechLambdas",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 32.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    "PVT Ltd",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 32.5,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,122,0),
                child: Container(
                  child: Text(
                    "Welcome Back !",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,160,0),
                child: Container(
                  child: Text(
                    "Sign in to ",
                    style: TextStyle(
                      color: Color.fromRGBO(31, 203, 79, 1),
                      fontSize: 31,
                    ),
                  ),
                ),
              ),
              SizedBox(height:5),
              Padding(
                padding: EdgeInsets.fromLTRB(5,0,130,0),
                child: Container(
                  child: Text(
                    "Lorem Ipsum is simply ",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height:25),
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,215,0),
                child: Container(
                  child: Text(
                    "User name",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height:10),
              Padding(
                padding: EdgeInsets.fromLTRB(130,0,0,0),
                child: Container(
                  height: 59,
                  width: 423,
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your user name',
                    ),
                    controller: usernameController,
                    onEditingComplete: () {
                      setState(() {
                        if(usernameController.text.isEmpty){
                          usernameError = true;
                        }else{
                          usernameError = false;
                        }
                      });
                    },
                  ),
                ),
              ),
              usernameError ?Padding(
                padding: const EdgeInsets.fromLTRB(0,0,155,0),
                child: Container(
                  child: Text(
                    "Enter your userName ",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ):Container(),
              SizedBox(height:20),
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,220,0),
                child: Container(
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height:10),
              Padding(
                padding: EdgeInsets.fromLTRB(130,0,0,0),
                child: Container(
                  height: 59,
                  width: 423,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(
                              r'[a-z0-9_=@,;!#$%^&*()-+":.?/\][{}><| ]')),
                    ],
                    controller: usernamePasswordController,
                    obscureText: _isObscure,
                    onEditingComplete: () {
                      setState(() {
                        if(usernamePasswordController.text.isEmpty){
                          usernamepassError = true;
                        }else{
                          usernamepassError = false;
                        }
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your password',
                        suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),

                  ),
                ),
              ),
              usernamepassError ?Padding(
                padding: const EdgeInsets.fromLTRB(0,0,155,0),
                child: Container(
                  child: Text(
                    "Enter your password ",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ):Container(),
              SizedBox(height:30),
              Padding(
                padding: EdgeInsets.fromLTRB(130,0,0,0),
                child: Container(
                    width: 425,
                    height: 70,
                    child: ElevatedButton(
                        child: Text(
                            "Login",
                            style: TextStyle(fontSize: 16)
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(31, 203, 79, 1)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                  side: BorderSide(color: Color.fromRGBO(31, 203, 79, 1)),
                                )
                            )
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>  EmployeeTable()),
                          );
                          setState(() {

                            if(usernameController.text.isEmpty || usernamePasswordController.text.isEmpty){
                              usernameError =true;
                              usernamepassError =true;
                            }else{
                              usernameError =false;
                              usernamepassError =false;

                            }
                          });

                        }
                    )
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}