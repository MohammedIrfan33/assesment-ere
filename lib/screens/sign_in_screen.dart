import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ui/constants/appcolors.dart';
import 'package:ui/controller/auth_controller.dart';
import 'package:ui/models/user_models.dart';
import 'package:ui/widgets/primary_button.dart';

import '../widgets/bottom_container.dart';
import '../widgets/text_editing_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //textediting controllers
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthController _authController = AuthController();

  bool loading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  //for signin user

  Future signIn(BuildContext context) async {
    if (_phoneNumberController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Phone Number Is Required')));
    } else if (_passwordController.text == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Password Is Required')));
    } else {
      final user = User(
          phoneNumber: _phoneNumberController.text.replaceAll('+',''),
          password: _passwordController.text);

      setState(() {
        loading = true;
      });

      await _authController.signIn(user, context);

      setState(() {
        loading = false;
      });
    }
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
                        height: 60,
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
                        'Welcome\nback to',
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
                        'CrowdAfrik',
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
                          'Sign In',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        
                        PhoneField(phoneNumberController: _phoneNumberController),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFieldWidgets(
                          controller: _passwordController,
                          hintText: 'Enter your  password',
                          isPasswordField: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password',
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : PrimaryButton(
                                onPress: () async {
                                  await signIn(context);
                                },
                                buttonText: 'LOGIN',
                                isIconed: false,
                              ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Don\'t have an account yet?',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.pushNamed(
                                            context, '/signup'),
                                      text: 'Sign Up',
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

class PhoneField extends StatelessWidget {
  const PhoneField({
    Key? key,
    required TextEditingController phoneNumberController,
  }) : _phoneNumberController = phoneNumberController, super(key: key);

  final TextEditingController _phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            //phone field
            IntlPhoneField(
          controller: _phoneNumberController,
          dropdownIconPosition: IconPosition.trailing,
          showCountryFlag: false,
          
          decoration: const InputDecoration(
            counterText: '',
            hintText: 'Phone Number',
            hintStyle:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffC6C6C6)),
            border: InputBorder.none,
          ),
          initialCountryCode: 'IN',
        ));
  }
}
