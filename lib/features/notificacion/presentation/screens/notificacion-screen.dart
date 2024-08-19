import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/noti/noti_bloc.dart';
import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/bloc/socket/socket_bloc.dart';
import 'package:notification/features/notificacion/domain/entities/comentario.dart';

class SalaNotificacion extends StatefulWidget {
  const SalaNotificacion({super.key});

  @override
  State<SalaNotificacion> createState() => _SalaNotificacionState();
}

class _SalaNotificacionState extends State<SalaNotificacion> {
  SocketBloc? socketBloc;
  NotiBloc? initNotificacionBloc;
  AuthBloc? authBloc;
  PublicacionBloc? publicacionBloc;

  @override
  void initState() {
    super.initState();
    socketBloc = BlocProvider.of<SocketBloc>(context, listen: false);
    publicacionBloc = BlocProvider.of<PublicacionBloc>(context, listen: false);
    initNotificacionBloc = BlocProvider.of<NotiBloc>(context, listen: false);
    authBloc = BlocProvider.of<AuthBloc>(context, listen: false);
    initNotificacionBloc!
        .add(OnGetComentarios(initNotificacionBloc!.state.idPublicacion));
    socketBloc!.socket!.on('mensaje-personal', (data) {
      initNotificacionBloc!
          .add(OnGetComentarios(initNotificacionBloc!.state.idPublicacion));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final notificacionBloc = BlocProvider.of<NotiBloc>(context, listen: true);
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 32, 109, 35),
          title: Text(
            'Comentarios',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  publicacionBloc.add(OnChagendeType(Type.comentario));
                  Navigator.pushNamed(context, 'publicacion');
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/comentariosImagen.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white.withOpacity(.45),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: notificacionBloc.state.mensajes.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Comentario comentario =
                            notificacionBloc.state.mensajes[index];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          height: 450,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Color.fromARGB(255, 32, 109, 35)
                                      .withOpacity(.8)),
                              color: Colors.white.withOpacity(.8),
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 200,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${comentario.imagen}'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  thickness: 2,
                                  color: Color.fromARGB(255, 32, 109, 35),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.description,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                    ),
                                    Text(
                                      'Descripción',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 32, 109, 35)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child: Text(
                                  '${comentario.descripcion}}',
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_city,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                    ),
                                    Text(
                                      'Direccion',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 32, 109, 35)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child: Text(
                                  '${comentario.direccion}}',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
