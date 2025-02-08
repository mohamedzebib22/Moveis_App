import 'package:flutter/material.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';

class UpddateProfile extends StatelessWidget {
  static const String id = 'UpddateProfile';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Center(
            child: Text(
          'pick Avatar',
          style: TextStyle(fontSize: 16, color: Colors.yellow),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              Image.asset('asset/image/avatar1.png'),
             const SizedBox(
                height: 20,
              ),
              CustomTextFeild(
                  prefix: Icon(Icons.person,color: Colors.white,size: 24,),
                  borderColor: Colors.black,
                  hintText: 'John Safwat'),
              SizedBox(
                height: height*0.02,
              ),
              CustomTextFeild(
                  prefix: Icon(Icons.phone,color: Colors.white,size: 24,),
                  borderColor: Colors.black,
                  hintText: '01200000000'),
              SizedBox(
                height: height*0.02,
              ),
              
             const Row(
                children: [
                  Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: height*.09,),
              CustomButton(
                itemColor: Color(0xFFE82626),
                textColor: Colors.white,
                title: 'Delete Account',
              ),
              CustomButton(
                itemColor: Color(0xFFF6BD00),
                textColor: Colors.white,
                title: 'Update Data',
              )
            ],
          ),
        ),
      ),
    );
  }
}
