import 'package:flutter/material.dart';
import 'package:newtest/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name='';
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  moveToHome() async{
      if(_formKey.currentState!.validate()) {
        setState(() {
          changeButton = true;
        });
        await Future.delayed(const Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.homeroute);
        setState(() {
          changeButton = false;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'username cant be empty';
                        }
                        return null;
                      },
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
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'Password cant be empty';
                        }
                        if(value.length<6) {
                          return 'Password length should be 6';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40,),
                    Material(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(changeButton?50:8),
                      child: InkWell(
                        onTap: () =>moveToHome(),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
