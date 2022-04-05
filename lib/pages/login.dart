import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/login.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
            //child: Text('test'),
          ),
          const  Text(
            "Welcome",
            style: TextStyle(
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
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password'
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed:(){
                      print('enterred');
                    },
                    child:Text('Login'),
                    style: TextButton.styleFrom(),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
