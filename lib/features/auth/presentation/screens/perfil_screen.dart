import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;

    String obtenerRol(String codigo) {
      switch (codigo) {
        case '1':
          return 'Vecino';
        case '2':
          return 'Administrativo';
        case '3':
          return 'Patrulla';
        default:
          return 'Rol no reconocido';
      }
    }

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/primerFondoPerfil.jpeg')),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.7,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.16,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          width: size.width,
                          height: size.height * 0.40,
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${authBloc.state.usuarioA!.name}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${obtenerRol(authBloc.state.usuarioA!.idrol.toString())}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.phone_android,
                                      size: 35,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                    ),
                                    label: Text(
                                      '${authBloc.state.usuarioA!.phoneNumber}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 32, 109, 35),
                                          fontSize: 20),
                                    )),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.credit_card,
                                      size: 35,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                    ),
                                    label: Text(
                                      '${authBloc.state.usuarioA!.ci}',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 32, 109, 35),
                                          fontSize: 20),
                                    )),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.password,
                                      size: 35,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                    ),
                                    label: Text(
                                      // '${authBloc.state.usuarioA!.password}',
                                      'Cifrado',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 32, 109, 35),
                                          fontSize: 20),
                                    )),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.location_on,
                                      size: 35,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                    ),
                                    label: Text(
                                      'Direccion',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 32, 109, 35),
                                          fontSize: 20),
                                    ))
                              ],
                            ),
                          )),
                      Container(
                        width: size.width,
                        height: size.height * 0.14,
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          width: size.width,
                          height: size.height * 0.14,
                          // color: Color.fromARGB(255, 32, 109, 35),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 32, 109, 35),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 32, 109, 35),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 32, 109, 35),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.2,
              left: size.width * 0.25,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 109, 35).withOpacity(.9),
                    shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      NetworkImage('${authBloc.state.usuarioA!.photoUrl}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
