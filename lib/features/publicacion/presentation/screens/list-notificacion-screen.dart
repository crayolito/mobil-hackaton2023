import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/noti/noti_bloc.dart';
import 'package:intl/intl.dart';

import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/bloc/socket/socket_bloc.dart';
import 'package:notification/features/notificacion/domain/entities/notificacion.dart';

class ListPublicacionsPage extends StatefulWidget {
  const ListPublicacionsPage({super.key});

  @override
  State<ListPublicacionsPage> createState() => _ListPublicacionsPageState();
}

class _ListPublicacionsPageState extends State<ListPublicacionsPage> {
  PublicacionBloc? publicacionBloc;
  SocketBloc? socketBloc;
  NotiBloc? notificacionBloc;

  @override
  void initState() {
    super.initState();
    publicacionBloc = BlocProvider.of<PublicacionBloc>(context, listen: false);
    notificacionBloc = BlocProvider.of<NotiBloc>(context, listen: false);
    // publicacionBloc!.add(OnGetNoticacionesP());
    notificacionBloc!.add(OnGetNoticaciones());
    socketBloc = BlocProvider.of<SocketBloc>(context, listen: false);
    socketBloc!.socket!.on('update-list', (data) {
      print('ME DEBO ACTUALIZAR');
      // publicacionBloc!.add(OnGetNoticacionesP());
      notificacionBloc!.add(OnGetNoticaciones());
      setState(() {});
    });
  }

  @override
  void dispose() {
    socketBloc!.socket!.off('update-list');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 32, 109, 35),
          title: Text(
            'Notificaciones',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: ContentPublicaciones());
  }
}

class ContentPublicaciones extends StatelessWidget {
  const ContentPublicaciones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificacionBloc = BlocProvider.of<NotiBloc>(context, listen: true);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/policias.jpg'),
                fit: BoxFit.cover)),
        child: ListView.builder(
            itemCount: notificacionBloc.state.notificaciones.length,
            itemBuilder: (context, index) {
              Notificacion notification =
                  notificacionBloc.state.notificaciones[index];

              return GestureDetector(
                onTap: () {
                  notificacionBloc.add(OnChangedIdPublicacion(notificacionBloc
                      .state.notificaciones[index].id
                      .toString()));
                  Navigator.pushNamed(context, 'chatSala');
                },
                child: ItemNotificacion(notification: notification),
              );
            }));
  }
}

class ItemNotificacion extends StatelessWidget {
  final Notificacion notification;
  const ItemNotificacion({super.key, required this.notification});

  String formatearFecha(DateTime dateTime) {
    final formato = DateFormat("MM/dd/yyyy hh:mm:ss a");
    return formato.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.only(top: 7),
      alignment: Alignment.topCenter,
      height: 114,
      decoration: BoxDecoration(
          border: Border.all(
              width: 4,
              color: Color.fromARGB(255, 32, 109, 35).withOpacity(.8)),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          color: Colors.white.withOpacity(.60),
          // color: Colors.red,
          boxShadow: const [
            BoxShadow(color: Colors.white, offset: Offset(-5, 4), blurRadius: 4)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                // padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/${notification.title}.png'))),
              ),
              Container(
                height: 75,
                width: 3,
                color: Color.fromARGB(255, 32, 109, 35),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(
                  left: 5,
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: 75,
                width: 270,
                // color: Colors.red,
                child: Column(
                  children: [
                    Text(
                      '${notification.title}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 32, 109, 35),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${notification.description}',
                      maxLines: 2,
                      style: TextStyle(
                          color: Color.fromARGB(255, 32, 109, 35),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 24,
            width: double.infinity,
            child: Text(
              '${notification.createdAt}',
              style: TextStyle(
                  color: Color.fromARGB(255, 32, 109, 35),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
