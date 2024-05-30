import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../feature_login_page/data/models/request/login_request_model.dart';
import '../../feature_login_page/logic/cubit/login_cubit/login_cubit.dart';
import '../../feature_login_page/logic/cubit/login_cubit/login_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = context.read<LoginCubit>();
    loginCubit.emitLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // Handle error state here if needed
            if (state is Error) {
              setupErrorState(context, state.error);
            }
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const CircularProgressIndicator(color: ColorsManager.mainBlack),
              success: (data) {
                final loginRequestModel = data as LoginRequestModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, ${loginRequestModel.name}',
                      style: const TextStyle(fontSize: 24,color: ColorsManager.mainBlack),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Birth date is: ${loginRequestModel.birthDate}',
                      style: const TextStyle(fontSize: 18,color: ColorsManager.mainBlack),

                    ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  void setupErrorState(BuildContext context, String error) {
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
  }
}
