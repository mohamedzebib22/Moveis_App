import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/cubits/register_cubit/register_cubit.dart';

import 'package:movies_app/models/asset_image.dart';
import 'package:movies_app/models/avatar_image_list.dart';
import 'package:movies_app/screens/login_page.dart';
import 'package:movies_app/widgets/create_account_and_log_in_widget.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_pick_avatar.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var name = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();
    var confirmPassword = TextEditingController();
    var phone = TextEditingController();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('SignUp Sucsess')));
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<RegisterCubit>(context);
          return SingleChildScrollView(
            child: Form(
              key: cubit.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.4,
                      aspectRatio: 10 / 5,
                      initialPage: 2,
                      onPageChanged: (index, reason) {
                        cubit.updateAvatar(index);
                      },
                    ),
                    itemCount: AvatarImageList.imageListAvatar.length,
                    itemBuilder: (context, itemIndex, int pageViewIndex) {
                      return CircleAvatar(
                        radius: 90,
                        backgroundColor:Colors.transparent,
                        child: CustomPickAvatar(
                          isBorder: false,
                            width: width,
                            height: height,
                            image: AvatarImageList
                                .imageListAvatar[itemIndex].image),
                      );
                    },
                  ),


                  // Image.asset(
                  //   'asset/image/avatar_group.png',
                  //   height: height * 0.2,
                  // ),


                  Text(
                    'Avatar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFeild(
                    controller: name,
                    validator: (name) {
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
                    controller: email,
                    validator: (email) {
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
                    controller: password,
                    validator: (password) {
                      return cubit.validateField(
                          password, 'Please Enter Password');
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
                    controller: confirmPassword,
                    validator: (confirmPassword) {
                      return cubit.validateField(
                          confirmPassword, 'Please Enter ConfirmPassword');
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
                    controller: phone,
                    validator: (phoneNumber) {
                      return cubit.validateField(
                          phoneNumber, 'Please Enter PhoneNumber');
                    },
                    hintText: 'Phone Number',
                    prefix: ImageIcon(
                      AssetImage(ImagesApp.phoneIcon),
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  state is RegisterLoading
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                          title: 'Create Account',
                          onTap: () async {
                            int avatarid = cubit.avatarNumber;

                            await cubit.signUp(
                                baseUrl: Endpoint.baseUrl,
                                name: name.text,
                                email: email.text,
                                password: password.text,
                                confirmPassword: confirmPassword.text,
                                phone: phone.text,
                                avaterId:avatarid);
                            print(
                                '=============${name.text}\n${email.text}\n${password.text}\n${confirmPassword.text}\n${phone.text}\n*********${cubit.avatarNumber}********\n====');
                          },
                        ),
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
    );
  }
}
