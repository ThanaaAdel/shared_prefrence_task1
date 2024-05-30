import '../../logic/cubit/login_cubit/login_cubit.dart';
import '../../logic/cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _SignInBlocListenerState();
}

class _SignInBlocListenerState extends State<LoginBlocListener> {


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state.isLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            ),
          );
        } else {
          Navigator.of(context).pop(); // Dismiss the loading dialog
          if (state.error != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.error!,
                  style: TextStyles.font14MediumLightBlack,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Got It ',
                      style: TextStyles.font20BoldBlack,
                    ),
                  ),
                ],
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            );
          } else {
            Navigator.of(context).pushNamed(Routes.homePage);
          }
        }
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          error,
          style: TextStyles.font14MediumLightBlack,
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Got It ',
                style: TextStyles.font20BoldBlack,
              )),
        ],
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),
    );
  }
}
