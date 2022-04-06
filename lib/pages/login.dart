import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtest/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name='';
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/login.png',
              fit: BoxFit.cover,
              //height: 400, //for testing the scrolling effect
            ),
            const SizedBox(
              height: 20,
              //child: Text('test'),
            ),
            Text(
              "Welcome, $name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter UserName',
                      labelText: 'UserName'
                    ),
                    onChanged: (value){
                      name=value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password'
                    ),
                  ),
                  const SizedBox(height: 40,),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeroute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      alignment: Alignment.center,
                      height: 50,
                      width: changeButton?50:150,
                      //color: Colors.deepPurpleAccent,
                      child: changeButton ? const Icon(Icons.done): const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(changeButton?50:8),
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  /*ElevatedButton(
                      onPressed:(){
                        Navigator.pushNamed(context, MyRoutes.homeroute);
                      },
                      child:const Text('Login'),
                      style: TextButton.styleFrom(minimumSize: const Size(150,50),),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
