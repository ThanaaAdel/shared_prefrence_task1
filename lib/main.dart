import 'package:flutter/material.dart';
import 'shared_prefrence_task1.dart';
import 'core/Routing/app_router.dart';
int? isViewed;
void main() async{
  runApp( SharedPreferenceTaskApp(appRouter: AppRouter(),));
}


