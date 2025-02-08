import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_feild.dart';


class UpddateProfile extends StatelessWidget {
  static const String routeName = 'UpddateProfile';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('pick Avatar',style: TextStyle(fontSize: 16,color: Colors.yellow),)),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,


        children: [
          SizedBox(height: 20),
Image.asset('assets/gamer (1).png'),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomTextFeild(
             prefix: Image.asset('assets/iconProfile.png',),
                borderColor: Colors.black,
                hintText: 'John Safwat'),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomTextFeild(
                prefix: Image.asset('assets/iconPhone.png'),

                borderColor: Colors.black,
                hintText: '01200000000'),
          ),

          Row(
            children: [
              Text('Reset Password',style: TextStyle(color: Colors.white),),
            ],
          ),
Spacer(),
          CustomButton(
            itemColor: Color(0xFFE82626),textColor:Colors.white ,

            title: 'Delete Account',),
          CustomButton(
            itemColor: Color(0xFFF6BD00),textColor:Colors.white ,

            title: 'Update Data',)
        ],
      ),
    );
  }
}