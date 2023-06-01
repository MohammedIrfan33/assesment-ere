
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/constants/appcolors.dart';
import 'package:ui/screens/sign_in_screen.dart';

import 'package:ui/widgets/primary_button.dart';

import '../utils/helper.dart';
import '../controller/auth_controller.dart';
import '../models/user_models.dart';
import '../widgets/bottom_container.dart';
import '../widgets/text_editing_widget.dart';

class SignUpScreen extends StatefulWidget {
 const  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  //text controllers
  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final AuthController _authController = AuthController();

  bool  loading = false;


  Future siginUp(BuildContext context) async {

   
    if (_nameController.text == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Name Required')));
    } else if (_phoneNumberController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Phone Number Is Required')));
    } else if (_emailController.text == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Email Is Required')));
    } else if (_passwordController.text == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Password Is Required')));
    } else {
      final user = User(
          fullName: _nameController.text,
          phoneNumber: _phoneNumberController.text.replaceAll('+',''),
          emailId: _emailController.text,
          deviceType: Helper.getPlatformName());


      setState(() {
        loading = true;
      });

      await _authController.signUp(user, context);

      setState(() {
        loading = false;
      });
      
    }
  }

  @override
  void dispose() {

    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    
    // TODO: implement dispose
    super.dispose();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                colors: [AppColors.gradientColor1, AppColors.gradientColor2],
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.only(left: 6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/icon.png',
                          width: 85,
                          height: 85,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        'Create better \ntogether',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Join our community',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: BottomContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFieldWidgets(
                          controller: _nameController,
                          hintText: 'Enter your name',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFieldWidgets(
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                          hintText: 'Enter your  Email',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PhoneField(phoneNumberController: _phoneNumberController),
                        const SizedBox(height: 20,),
                         TextFieldWidgets(
                          controller: _passwordController,
                          hintText: 'Enter your  password',
                          isPasswordField: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : PrimaryButton(
                          onPress: ()  {
                            siginUp(context);
                           

                          },
                          buttonText: 'CONTINUE',
                          isIconed: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Already member',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.pushNamed(
                                            context,
                                            '/signin'),
                                      text: 'Sign In',
                                      style: TextStyle(
                                          color: AppColors.primaryColor))
                                ])),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
