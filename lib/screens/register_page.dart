import 'package:flutter/material.dart';
import 'package:movies_app/components/register_page_body.dart';

import 'package:movies_app/widgets/create_account_and_log_in_widget.dart';
import 'package:movies_app/widgets/custom_button.dart';
import 'package:movies_app/widgets/custom_text_feild.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(child: RegisterPageBody()),
    );
  }
}
