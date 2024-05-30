import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/feature_login_page/logic/cubit/login_cubit/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
 Future<void> setupGetIt () async{
//Dio & apiServices
  Dio dio =  await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login page
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
 }