import 'package:flutter/material.dart';

import 'package:movies_app/Features/update_profile_page/presentation/views/widgets/update_profile_body.dart';

class UpddateProfile extends StatelessWidget {
  const UpddateProfile({super.key});
  static String id = 'UpdateProfile';

  @override
  Widget build(BuildContext context) {
    return UpdateProfileBody();
  }
}
