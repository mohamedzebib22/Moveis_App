import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/cubits/login_cubit/login_cubit.dart';
import 'package:movies_app/cubits/login_cubit/login_state.dart';
import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/models/asset_style.dart';
import 'package:movies_app/widgets/create_account_and_log_in_widget.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_divider.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';
import 'package:movies_app/widgets/forget_widget.dart';
import 'package:movies_app/widgets/or_widget.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var email = TextEditingController();
    var password = TextEditingController();
    var formkey = GlobalKey<FormState>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        
         if(state is LoginSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Sucsess')));
        }
        else if(state is LoginFailure){
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        var cubit =BlocProvider.of<LoginCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.02),
          child: Form(
            key:formkey ,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                Image.asset(
                  ImagesApp.iconApp,
                  width: width * 0.28,
                  height: height * 0.12,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextFeild(
                  validator: (email) {
                      return cubit.validateField(email, 'Please Enter Email');
                    },
                  hintText: 'Email',
                  prefix: Icon(
                    Icons.email,
                    size: 24,
                    color: Colors.white,
                  ),
                  controller: email,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTextFeild(
                  validator: (email) {
                      return cubit.validateField(email, 'Please Enter Password');
                    },
                  hintText: 'Paswword',
                  prefix: Icon(
                    Icons.lock,
                    size: 24,
                    color: Colors.white,
                  ),
                  sufix: Icon(
                    Icons.visibility_off,
                    size: 24,
                    color: Colors.white,
                  ),
                  controller: password,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                ForgetWidget(onTap: () { 
                  cubit.NavigateToForgetPasswordPage(context);
                 },),
                SizedBox(
                  height: height * 0.04,
                ),
               state is LoginLoading
                    ? Center(child: CircularProgressIndicator()) :CustomButton(
                  title: 'Login',
                  onTap: (){
                    if(formkey.currentState?.validate()==true){
                      cubit.signIn(email.text, password.text,Endpoint.baseUrl);
                    }
                    
                    
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CreateAccountAndLoginWidget(text1: 'Don’t Have Account?', text2: 'CreateAcount', onTap: () { 
                  cubit.NavigateToRegisterPage(context);
                 },),
                SizedBox(
                  height: height * 0.04,
                ),
                OrWidget(),
                CustomButton(title: 'Login With Google'),
              ],
            ),
          ),
        );
      },
    );
  }
}
