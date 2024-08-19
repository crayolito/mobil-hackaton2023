import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/gps/gps_bloc.dart';
import 'package:notification/bloc/notificacions/notificacions_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/primerfondo.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              height: size.height * 0.40,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.70),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text("PERMISOS APP",
                      softWrap: true,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 32, 109, 35),
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  const _permisoNotificacion(),
                  const _permisoAccesoUbicacion(),
                  const _permisoGps(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'categorias');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white.withOpacity(0.50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Color.fromARGB(255, 32, 109, 35),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      "Seguir",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 109, 35),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}

class _permisoGps extends StatelessWidget {
  const _permisoGps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gpsBloc = BlocProvider.of<GpsBloc>(context, listen: true);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            child: Text("Gps",
                softWrap: true,
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Color.fromARGB(255, 32, 109, 35),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          IconButton(
            onPressed: () {},
            icon: gpsBloc.state.isGpsEnabled == true
                ? const Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 32, 109, 35),
                  )
                : const Icon(
                    Icons.offline_bolt_rounded,
                    color: Colors.red,
                  ),
          )
        ],
      ),
    );
  }
}

class _permisoAccesoUbicacion extends StatelessWidget {
  const _permisoAccesoUbicacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gpsBloc = BlocProvider.of<GpsBloc>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text("Acceso Ubicacion",
                softWrap: true,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Color.fromARGB(255, 32, 109, 35),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          IconButton(
            onPressed: () {
              gpsBloc.askGpsAccess();
            },
            icon: gpsBloc.state.isGpsPermissionGranted == true
                ? const Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 32, 109, 35),
                  )
                : const Icon(
                    Icons.offline_bolt_rounded,
                    color: Colors.red,
                  ),
          )
        ],
      ),
    );
  }
}

class _permisoNotificacion extends StatelessWidget {
  const _permisoNotificacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificacionsBloc =
        BlocProvider.of<NotificacionsBloc>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text("Notificaciones",
                softWrap: true,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Color.fromARGB(255, 32, 109, 35),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          IconButton(
            onPressed: () {
              notificacionsBloc.requestPermission();
            },
            icon:
                notificacionsBloc.state.status == AuthorizationStatus.authorized
                    ? const Icon(
                        Icons.check_circle,
                        color: Color.fromARGB(255, 32, 109, 35),
                      )
                    : const Icon(
                        Icons.offline_bolt_rounded,
                        color: Colors.red,
                      ),
          )
        ],
      ),
    );
  }
}
