import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/api/api_consumer.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitial());
  final ApiConsumer api;

  String? validateField(String? title, String errorMessage) {
    if (title == null || title.isEmpty) {
      return errorMessage;
    }
    return null;
  }
  
}
