import 'package:flutter/material.dart';

import 'package:movies_app/components/update_profile_body.dart';

class UpddateProfile extends StatelessWidget {
  const UpddateProfile({super.key});
  static String id = 'UpdateProfile';

  @override
  Widget build(BuildContext context) {
    return UpdateProfileBody();
  }
}
