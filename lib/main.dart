import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/gps/gps_bloc.dart';
import 'package:notification/bloc/location/location_bloc.dart';
import 'package:notification/bloc/login/login_form_bloc.dart';
import 'package:notification/bloc/map/map_bloc.dart';
import 'package:notification/bloc/noti/noti_bloc.dart';
import 'package:notification/bloc/notificacions/notificacions_bloc.dart';
import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/bloc/registre/registre_form_bloc.dart';
import 'package:notification/bloc/socket/socket_bloc.dart';
import 'package:notification/bloc/usuarios/usuarios_bloc.dart';
import 'package:notification/config/router/app_router.dart';
import 'package:notification/constants/environment.dart';
import 'package:notification/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificacionsBloc.initializeFCM();
  await Environment.initEnvironment();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NotificacionsBloc()),
    BlocProvider(
      create: (context) => GpsBloc(),
    ),
    BlocProvider(
      create: (context) => LocationBloc(),
    ),
    BlocProvider(
      create: (context) => MapBloc(),
    ),
    BlocProvider(
      create: (context) => RegistreFormBloc(
          locationBloc: BlocProvider.of<LocationBloc>(context),
          notificacionsBloc: BlocProvider.of<NotificacionsBloc>(context)),
    ),
    BlocProvider(
      create: (context) => AuthBloc(),
    ),
    BlocProvider(
      create: (context) =>
          LoginFormBloc(authBloc: BlocProvider.of<AuthBloc>(context)),
    ),
    BlocProvider(
      create: (context) =>
          SocketBloc(authBloc: BlocProvider.of<AuthBloc>(context)),
    ),
    BlocProvider(
      create: (context) => PublicacionBloc(
          authBloc: BlocProvider.of<AuthBloc>(context),
          socketBloc: BlocProvider.of<SocketBloc>(context)),
    ),
    BlocProvider(
      create: (context) => UsuariosBloc(
          authBloc: BlocProvider.of<AuthBloc>(context),
          locationBloc: BlocProvider.of<LocationBloc>(context),
          publicacionBloc: BlocProvider.of<PublicacionBloc>(context)),
    ),
    BlocProvider(
      create: (context) => NotiBloc(
          publicacion: BlocProvider.of<PublicacionBloc>(context),
          socketBloc: BlocProvider.of<SocketBloc>(context),
          authBloc: BlocProvider.of<AuthBloc>(context)),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: appRoutes,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        builder: (context, child) {
          return HandleNotificationInteractions(child: child!);
        });
  }
}

class HandleNotificationInteractions extends StatefulWidget {
  final Widget child;
  const HandleNotificationInteractions({super.key, required this.child});

  @override
  State<HandleNotificationInteractions> createState() =>
      _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState
    extends State<HandleNotificationInteractions> {
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {}

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
