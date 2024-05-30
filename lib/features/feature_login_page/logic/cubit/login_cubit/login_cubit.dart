import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'login_state.dart';
import 'package:ablexa/core/prefrences/prefrences.dart';
import 'package:ablexa/features/feature_login_page/data/models/request/login_request_model.dart';

class LoginCubit extends Cubit<LoginState<String>> {
  LoginCubit() : super(const LoginState.initial()) {
    prefs = Preferences(); // Initialize prefs
    getUserData(); // Call getUserData when LoginCubit is initialized
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  Preferences? prefs;

  // Define the login method
  Future<void> emitLogin() async {
    emit(const LoginState.loading());
    // Retrieve name and birth date from TextEditingController
    String name = nameController.text;
    String birthDate = birthDateController.text;

    // Validate the birth date format
    String birthDateFormat = 'dd/MM/yyyy'; // Define the expected date format
    DateTime? parsedBirthDate;
    try {
      parsedBirthDate = DateFormat(birthDateFormat).parse(birthDate);
    } catch (e) {
      // Handle invalid date format
      emit(const LoginState.error(error: 'Invalid birth date format. Please enter a valid date.'));
      return; // Exit the method early
    }

    // Store user data in SharedPreferences
    if (prefs != null) {
      prefs!.setUser(LoginRequestModel(name, parsedBirthDate));
    } else {
      emit(const LoginState.error(error: 'Preferences is null'));
      return; // Exit the method early to avoid further issues
    }

    // Update state with the retrieved data
    emit(LoginState.success(name));
  }

  // Method to fetch user data from SharedPreferences
  Future<void> getUserData() async {
    try {
      // Ensure prefs is not null before using it
      if (prefs != null) {
        LoginRequestModel userModel = await prefs!.getUserModel();
        if (userModel.name != null && userModel.birthDate != null) {
          nameController.text = userModel.name!;
          birthDateController.text = DateFormat('dd/MM/yyyy').format(userModel.birthDate!);
        }
      } else {
        // Handle case where prefs is null
        emit(const LoginState.error(error: 'Preferences is null'));
      }
    } catch (e) {
      // Handle errors
      emit(const LoginState.error(error: 'Failed to fetch user data'));
    }
  }
}
