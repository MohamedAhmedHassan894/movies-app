import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/internet_connection/network_bloc.dart';
import 'business_logic/cubit/internet_connection/network_events.dart';
import 'helpers/app_router.dart';
import 'helpers/bloc_observer.dart';
import 'helpers/logger_helper.dart';
import 'utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoggerHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => NetworkBloc()..add(NetworkObserve()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
