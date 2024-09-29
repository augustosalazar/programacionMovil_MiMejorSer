import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/Controller/accountController.dart';
import 'package:my_app/pages/main.dart';
import 'package:my_app/pages/welcome.dart';


class LoginPage extends StatefulWidget {



  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
 final Accountcontroller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: IconButton(
          onPressed: () {
           Get.off(()=>HomePage());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: Text(
                            "Inicia sesión con tu cuenta",
                            style: TextStyle(
                                fontSize: 15, color: Theme.of(context).colorScheme.primary),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: makeInput(
                            label: "Correo",
                            controller: emailController,
                          ),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: makeInput(
                            label: "Contraseña",
                            obscureText: true,
                            controller: passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1400),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                        ),
                        child:MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            // Verificar si los datos coinciden
                            
                            if (controller.emailGetList.contains(emailController.text) &&
                               controller.confirmPassword(controller.emailGetList.indexOf(emailController.text))==
                               passwordController.text
                               ) {
                                
                                controller.emailpassword('$emailController', '$passwordController');
                              controller.emailpassword(emailController.text, passwordController.text);
                              Get.off(()=>const QuestionPage());
                              
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Email o contraseña incorrectos"),
                                ),
                              );
                            }
                          },
                          color: Theme.of(context).colorScheme.primaryContainer,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18,
                                color:Theme.of(context).colorScheme.primary ,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("¿No tienes una cuenta? "),
                        Text(
                          "Registrarse",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Lottie.asset('assets/wave.json',
                      fit: BoxFit.cover, width: screenWidth),
                )),
          ],
        ),
      ),
    );
  }

  Widget makeInput({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style:  TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
