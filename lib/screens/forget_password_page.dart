import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/widgets/custom_button.dart';
import 'package:movies_app/core/utils/widgets/custom_text_feild.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static String id = 'ForgetPasswordPage';

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.yellow,
        ),
        title: Center(
            child: Text(
          'Forget Password',
          style: TextStyle(fontSize: 16, color: Colors.yellow),
        )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'asset/image/forgot_password.png',
                height: screenSize.height * 0.5,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFeild(
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return ('Please Enter Email');
                  }
                  return null;
                },
                hintText: 'Email',
                prefix: ImageIcon(
                  AssetImage('asset/icons/icon_email.png'),
                  size: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                title: 'Verify Email',
                onTap: () {
                  if (formkey.currentState?.validate() == true) {
                    print('test');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
