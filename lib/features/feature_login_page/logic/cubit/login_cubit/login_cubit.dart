import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:ablexa/core/prefrences/prefrences.dart';
import 'package:ablexa/features/feature_login_page/data/models/request/login_request_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial()) {
    prefs = Preferences(); // Initialize prefs
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  Preferences? prefs;

  // Define the login method
  Future<void> login() async {
    emit(state.copyWith(isLoading: true));
    // Retrieve name and birth date from TextEditingController
    String name = nameController.text;
    String birthDate = birthDateController.text;

    // Validate the birth date format
    DateTime? parsedBirthDate;
    try {
      parsedBirthDate = DateTime.parse(birthDate);
    } catch (e) {
      // Handle invalid date format
      emit(state.copyWith(
        isLoading: false,
        error: 'Invalid birth date format. Please enter a valid date.',
      ));
      return; // Exit the method early
    }

    // Ensure prefs is not null before using it
    if (prefs != null) {
      // Set user data in Preferences
      prefs!.setUser(LoginRequestModel(name, parsedBirthDate));
    } else {
      // Handle case where prefs is null
      emit(state.copyWith(error: 'Preferences is null'));
      return; // Exit the method early to avoid further issues
    }

    // Update state with the retrieved data
    emit(state.copyWith(
      isLoading: false,
      userName: name,
      userBirthDate: parsedBirthDate.toString(),
      error: null, // Clear any previous errors
    ));
  }

  // Method to fetch user data from SharedPreferences
  Future<void> getUserData() async {
    try {
      // Ensure prefs is not null before using it
      if (prefs != null) {
        LoginRequestModel userModel = await prefs!.getUserModel();
        if (userModel.name != null && userModel.birthDate != null) {
          nameController.text = userModel.name!;
          birthDateController.text = userModel.birthDate!.toString();
        }
      } else {
        // Handle case where prefs is null
        emit(state.copyWith(error: 'Preferences is null'));
      }
    } catch (e) {
      // Handle errors
      emit(state.copyWith(error: 'Failed to fetch user data'));
    }
  }
}
