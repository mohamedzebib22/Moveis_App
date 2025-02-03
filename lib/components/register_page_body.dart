import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/register_cubit/register_cubit.dart';

import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/screens/login_page.dart';
import 'package:movies_app/widgets/create_account_and_log_in_widget.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
  var formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back), color: Colors.yellow,),
        title: Center(
            child: Text(
          'Register',
          style: TextStyle(fontSize: 16, color: Colors.yellow),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.02),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
             if(state is RegisterSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Sucsess')));
        }
        else if(state is RegisterFailure){
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)));
        }
          },
          builder: (context, state) {
            var cubit =BlocProvider.of<RegisterCubit>(context);
            return Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'asset/image/avatar_group.png',
                      height: height * 0.2,
                    ),
                    Text(
                      'Avatar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFeild(
                      validator: (name){
                        return cubit.validateField(name, 'Please Enter Name');
                      },
                      hintText: 'Name',
                      prefix: ImageIcon(
                        AssetImage(ImagesApp.userNameIcon),
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                      validator: (email){
                        return cubit.validateField(email, 'Please Enter Email');
                      },
                      hintText: 'Email',
                      prefix: ImageIcon(
                        AssetImage(ImagesApp.emailIcon),
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                      validator: (password){
                        return cubit.validateField(password, 'Please Enter Password');
                      },
                      hintText: 'Password',
                      prefix: ImageIcon(
                        AssetImage(ImagesApp.paswwordIcon),
                        size: 24,
                        color: Colors.white,
                      ),
                      sufix: IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage('asset/icons/icon _eye off.png'),
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                      validator: (confirmPassword){
                        return cubit.validateField(confirmPassword, 'Please Enter ConfirmPassword');
                      },
                      hintText: 'Confirm Password',
                      prefix: ImageIcon(
                        AssetImage(ImagesApp.paswwordIcon),
                        size: 24,
                        color: Colors.white,
                      ),
                      sufix: IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage('asset/icons/icon _eye off.png'),
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFeild(
                      validator: (phoneNumber){
                        return cubit.validateField(phoneNumber, 'Please Enter PhoneNumber');
                      },
                      hintText: 'Phone Number',
                      prefix: ImageIcon(
                        AssetImage(ImagesApp.phoneIcon),
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    CustomButton(title: 'Create Account',onTap: (){
                      if(formkey.currentState?.validate() ==true){
                        print('Test');
                      }
                    },),
                    CreateAccountAndLoginWidget(
                      text1: 'AlreadyHaveAccount?',
                      text2: 'LogIn',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, LoginPage.id);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
