import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Features/update_profile_page/data/cubit/update_profile_cubit/update_profile_state.dart';

import 'package:movies_app/core/utils/models/asset_image.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  String currentAvatar = ImagesApp.avatar1;
  dynamic changeAvatar(String newAvatar,context){
    currentAvatar =newAvatar;
    Navigator.pop(context); 

    emit(UpdateProfileChangeAvatar());
  }
}
