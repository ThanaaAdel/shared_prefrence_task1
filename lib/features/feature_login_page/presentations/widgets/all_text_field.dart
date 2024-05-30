import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';
import 'login_bloc_listener.dart';

class AllTextFieldsWidget extends StatefulWidget {
  const AllTextFieldsWidget({Key? key}) : super(key: key);

  @override
  State<AllTextFieldsWidget> createState() => _AllTextFieldsWidgetState();
}

class _AllTextFieldsWidgetState extends State<AllTextFieldsWidget> {
  late TextEditingController _birthDateController;

  @override
  void initState() {
    super.initState();
    _birthDateController = context.read<LoginCubit>().birthDateController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).full_name, style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                AppTextFormField(
                  maxLines: 1,
                  controller: context.read<LoginCubit>().nameController,
                  hintText: S.of(context).name_hint_text,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null; // Return null if the name is valid
                  },
                ),
                verticalSpacing(10),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).birth_date, style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        maxLines: 1,
                        controller: _birthDateController,
                        hintText: 'DD/MM/YYYY', // Provide a hint for the date format
                        validator: (date) {
                          // You can add validation logic for the birth date if needed
                          if (date!.isEmpty) {
                            return 'Birth date cannot be empty';
                          }
                          return null; // Return null if the date is valid
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Show date picker when the icon button is pressed
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                verticalSpacing(10),
              ],
            ),
            verticalSpacing(40),
            Padding(
              padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 30.h, bottom: 30.h),
              child: AppTextButton(
                backgroundColor: Colors.blue,
                textStyle: TextStyles.font18SemiBoldWhite,
                textButton: S.of(context).login,
                onPressed: () {
                  validateThenDoSignUp(context);
                },
              ),
            ),
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLogin();
      print("the name : ${context.read<LoginCubit>().nameController.text} and the birth date is ${context.read<LoginCubit>().birthDateController.text}");
    } else {
      print("Validation failed. Please check the form fields.");
    }
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      // Format the picked date to 'DD/MM/YYYY' format
      String formattedDate = '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}';

      // Update the text in the birth date controller
      _birthDateController.text = formattedDate;
    }
  }


}
