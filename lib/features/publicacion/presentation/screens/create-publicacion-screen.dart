import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/location/location_bloc.dart';
import 'package:notification/bloc/noti/noti_bloc.dart';
import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/bloc/usuarios/usuarios_bloc.dart';
import 'package:notification/services/camera_gallery_service_impl.dart';

// ···
StreamSubscription? publicacionSubscription;

class PublicacionPage extends StatefulWidget {
  const PublicacionPage({super.key});

  @override
  State<PublicacionPage> createState() => _PublicacionPageState();
}

class _PublicacionPageState extends State<PublicacionPage> {
  String? dropdownValue = 'Incendio';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    publicacionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tipoDenuncias = ['Incendio', 'Accidente', 'Robo'];

    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;

    ImageProvider<Object> selectImage() {
      switch (publicacionBloc.state.estado) {
        case Status.none:
          return AssetImage('assets/images/insertImage.jpg');
        case Status.processing:
          return FileImage(File(publicacionBloc.state.imagen));
        case Status.complete:
          return NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/7/78/Image.jpg");
      }
    }

    String _titulo() {
      if (publicacionBloc.state.type == Type.publicacion) {
        return 'Publicacion';
      } else {
        return 'Comentario';
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/publicacionImage.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white.withOpacity(.60),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text('Crear ${_titulo()}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Color.fromARGB(255, 32, 109, 35),
                              fontFamily: 'Courier',
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 300,
                    width: size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: selectImage())),
                  ),
                  const _titleDenuncia(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: const Color.fromARGB(255, 32, 109, 35),
                        size: 50,
                      ),
                      style: TextStyle(
                          color: Color.fromARGB(255, 32, 109, 35),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          publicacionBloc.add(OnTituloChanged(dropdownValue!));
                        });
                      },
                      items: tipoDenuncias
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Color.fromARGB(255, 32, 109, 35),
                      thickness: 2,
                    ),
                  ),
                  const _titleDescripcion(),
                  const _containerDescripcion(),
                  const SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text('Direccion',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Color.fromARGB(255, 32, 109, 35),
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                  ),
                  const _containerDireccion(),
                  const SizedBox(height: 20),
                  const _settings(),
                  _searchUsuarios(size: size)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _searchUsuarios extends StatefulWidget {
  const _searchUsuarios({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<_searchUsuarios> createState() => _searchUsuariosState();
}

class _searchUsuariosState extends State<_searchUsuarios> {
  @override
  Widget build(BuildContext context) {
    final usuariosBloc = BlocProvider.of<UsuariosBloc>(context, listen: true);
    final authBloc = BlocProvider.of<AuthBloc>(context, listen: true);
    return Container(
      alignment: Alignment.bottomCenter,
      width: widget.size.width,
      height: 110,
      // color: Colors.amber,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            final idAuth = authBloc.state.usuarioA!.id;
             usuariosBloc.add(OnGetUsuarios(idAuth));
          },
          // -17.776986, -63.195047

          // -17.784787, -63.195887

          // -17.791239, -63.173296
          child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: Color.fromARGB(255, 32, 109, 35), width: 3),
              ),
              child: Text('${usuariosBloc.state.selectos}',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Color.fromARGB(255, 32, 109, 35),
                      fontSize: 40,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}

class _settings extends StatelessWidget {
  const _settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _enviarBtn(),
          SizedBox(width: 20),
          _locationBtn(),
          SizedBox(width: 20),
          _galleryBtn(),
          SizedBox(width: 20),
          _cameraBtn(),
          SizedBox(width: 20),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Color.fromARGB(255, 32, 109, 35), width: 2),
            ),
            child: IconButton(
              onPressed: () {
                publicacionBloc.add(OnClearPublicacion());
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Color.fromARGB(255, 32, 109, 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _cameraBtn extends StatelessWidget {
  const _cameraBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromARGB(255, 32, 109, 35), width: 2),
      ),
      child: IconButton(
        onPressed: () async {
          final photoPath = await CameraGalleryServiceImpl().takePhoto();
          if (photoPath == null) return;
          publicacionBloc.add(OnImageChanged(photoPath));
        },
        icon: Icon(
          Icons.camera_alt,
          color: Color.fromARGB(255, 32, 109, 35),
        ),
      ),
    );
  }
}

class _galleryBtn extends StatelessWidget {
  const _galleryBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            10), // Ajusta el radio del borde según tus preferencias
        border: Border.all(
            color: Color.fromARGB(255, 32, 109, 35),
            width: 2), // Color y ancho del borde
      ),
      child: IconButton(
        // onPressed: () {}
        onPressed: () async {
          final photoPath = await CameraGalleryServiceImpl().selectPhoto();
          if (photoPath == null) return;
          publicacionBloc.add(OnImageChanged(photoPath));
        },
        icon: Icon(
          Icons.collections,
          color: Color.fromARGB(255, 32, 109, 35),
        ),
      ),
    );
  }
}

class _locationBtn extends StatefulWidget {
  const _locationBtn({
    super.key,
  });

  @override
  State<_locationBtn> createState() => _locationBtnState();
}

class _locationBtnState extends State<_locationBtn> {
  @override
  Widget build(BuildContext context) {
    // final locationBloc = BlocProvider.of(context, listen: true);
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            10), // Ajusta el radio del borde según tus preferencias
        border: Border.all(
            color: Color.fromARGB(255, 32, 109, 35),
            width: 2), // Color y ancho del borde
      ),
      child: IconButton(
        onPressed: () async {
          final direccion = await LocationBloc().getCurrentLocation();
          publicacionBloc.add(OnZonaUbicacionChanged(direccion));
          setState(() {});
        },
        icon: Icon(
          Icons.gps_fixed,
          color: Color.fromARGB(255, 32, 109, 35),
        ),
      ),
    );
  }
}

class _enviarBtn extends StatelessWidget {
  const _enviarBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    final notificacionBloc = BlocProvider.of<NotiBloc>(context, listen: true);

    return ElevatedButton(
      onPressed: () {
        if (publicacionBloc.state.type == Type.publicacion) {
          publicacionBloc.add(OnNewPublicacion());
          publicacionSubscription = publicacionBloc.stream.listen((event) {
            if (event.estado == Status.complete) {
              publicacionBloc.add(OnClearPublicacion());
              Navigator.pop(context);
            }
          });
        } else {
          final idPublicacion = notificacionBloc.state.idPublicacion;
          notificacionBloc.add(OnSaveComentario(idPublicacion));
          publicacionSubscription = publicacionBloc.stream.listen((event) {
            if (event.estado == Status.complete) {
              publicacionBloc.add(OnClearPublicacion());
              Navigator.pop(context);
            }
          });
        }
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
        "Enviar",
        style: TextStyle(
          color: Color.fromARGB(255, 32, 109, 35),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _containerDireccion extends StatelessWidget {
  const _containerDireccion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    controller.text = publicacionBloc.state.zonaUbicacion;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          publicacionBloc.add(OnZonaUbicacionChanged(value));
        },
        cursorColor: Color.fromARGB(255, 32, 109, 35),
        style: TextStyle(
          color: Color.fromARGB(255, 32, 109, 35),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 32, 109, 35),
          ), // Estilo del marcador
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 32, 109, 35), width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
        ),
      ),
    );
  }
}

class _titleDescripcion extends StatelessWidget {
  const _titleDescripcion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.bottomStart,
      child: Text('Descripcion',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Color.fromARGB(255, 32, 109, 35),
              fontSize: 22,
              fontWeight: FontWeight.bold)),
    );
  }
}

class _containerDescripcion extends StatelessWidget {
  const _containerDescripcion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: TextFormField(
        onChanged: (value) {
          publicacionBloc.add(OnDescripcionChanged(value));
        },
        cursorColor: Color.fromARGB(255, 32, 109, 35),
        style: TextStyle(
          color: Color.fromARGB(255, 32, 109, 35),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 32, 109, 35),
          ), // Estilo del marcador
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 32, 109, 35), width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
        ),
      ),
    );
  }
}

class _titleDenuncia extends StatelessWidget {
  const _titleDenuncia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.bottomStart,
      child: Text('Tipo Denuncia',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Color.fromARGB(255, 32, 109, 35),
              fontSize: 22,
              fontWeight: FontWeight.bold)),
    );
  }
}
