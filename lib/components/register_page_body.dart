import 'package:flutter/material.dart';
import 'package:movies_app/widgets/already_have_account_widget.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back), color: Colors.yellow,),
        title: Center(child: Text('Register', style: TextStyle(fontSize: 16, color: Colors.yellow),)),
      ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('asset/image/avatar_group.png', height: screenSize.height * 0.2,),
          Text('Avatar', style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          CustomTextFeild(hintText: 'Name', prefix: ImageIcon(AssetImage('asset/icons/icon _username.png'), size: 24, color: Colors.white,),),
          SizedBox(height: 20,),
          CustomTextFeild(hintText: 'Email', prefix: ImageIcon(AssetImage('asset/icons/icon_email.png'),size: 24, color: Colors.white,),),
          SizedBox(height: 20,),
          CustomTextFeild(hintText: 'Password', prefix: ImageIcon(AssetImage('asset/icons/icon_password.png'),size: 24, color: Colors.white,), sufix: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('asset/icons/icon _eye off.png'),size: 24, color: Colors.white,),),),
          SizedBox(height: 20,),
          CustomTextFeild(hintText: 'Confirm Password', prefix: ImageIcon(AssetImage('asset/icons/icon_password.png'),size: 24, color: Colors.white,), sufix: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('asset/icons/icon _eye off.png'),size: 24, color: Colors.white,),),),
          SizedBox(height: 20,),
          CustomTextFeild(hintText: 'Phone Number', prefix: ImageIcon(AssetImage('asset/icons/icon_phone.png'),size: 24, color: Colors.white,),),
          CustomButton(title: 'Create Account'),
          AlreadyHaveAccountWidget()
        ],
      ),
      ),
    );
  }
}