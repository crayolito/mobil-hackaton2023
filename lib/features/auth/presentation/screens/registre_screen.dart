import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/registre/registre_form_bloc.dart';
import 'package:notification/services/camera_gallery_service_impl.dart';

// StreamSubscription? subscription;

class RegistreScreen extends StatefulWidget {
  const RegistreScreen({super.key});

  @override
  State<RegistreScreen> createState() => _RegistreScreenState();
}

class _RegistreScreenState extends State<RegistreScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registreFormBloc =
        BlocProvider.of<RegistreFormBloc>(context, listen: true);
    ImageProvider<Object> selectImage() {
      switch (registreFormBloc.state.estado) {
        case Status.none:
          return AssetImage('assets/images/fotoPerfil.jpg');
        case Status.proccesing:
          return FileImage(File(registreFormBloc.state.image));
        case Status.success:
          return NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/7/78/Image.jpg");
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
                  image: AssetImage('assets/images/perfilImage.jpg'),
                  fit: BoxFit.cover)),
        ),
        SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white.withOpacity(.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 122, 122, 122)
                          .withOpacity(.70),
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final photoPath =
                            await CameraGalleryServiceImpl().selectPhoto();
                        if (photoPath == null) return;
                        registreFormBloc.add(OnChangedImage(photoPath));
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: selectImage(),
                          )),
                    )),
                Text(
                  'Registro',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Color.fromARGB(255, 32, 109, 35),
                      fontFamily: 'Courier',
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                const _containerNombre(),
                const _containerCI(),
                const _containerTelefono(),
                const _containerPassword(),
                const SizedBox(height: 20),
                const _settings()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class _settings extends StatelessWidget {
  const _settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registreFormBloc =
        BlocProvider.of<RegistreFormBloc>(context, listen: true);

    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              registreFormBloc.add(OnSubmitForm());
              registreFormBloc.stream.listen((event) {
                if (event.estado == Status.success) {
                  Navigator.pushReplacementNamed(context, 'categorias');
                }
              });
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
              "Registrarse",
              style: TextStyle(
                color: Color.fromARGB(255, 32, 109, 35),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
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
              onPressed: () {},
              icon: Icon(
                Icons.location_history,
                color: Color.fromARGB(255, 32, 109, 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _containerPassword extends StatelessWidget {
  const _containerPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registreFormBloc =
        BlocProvider.of<RegistreFormBloc>(context, listen: true);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10, left: 10),
      margin: EdgeInsets.symmetric(horizontal: 45),
      child: TextFormField(
        onChanged: (value) {
          registreFormBloc.add(OnChagendPassword(value));
        },
        cursorColor: Color.fromARGB(255, 32, 109, 35),
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Courier',
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.password,
            color: Color.fromARGB(255, 32, 109, 35),
          ),
          labelText: 'Contraseña', // Texto del marcador
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 32, 109, 35),
          ), // Estilo del marcador
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
        ),
      ),
    );
  }
}

class _containerTelefono extends StatelessWidget {
  const _containerTelefono({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registreFormBloc =
        BlocProvider.of<RegistreFormBloc>(context, listen: true);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10, left: 10),
      margin: EdgeInsets.symmetric(horizontal: 45),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          registreFormBloc.add(OnChagedTelefono(int.tryParse(value)!));
        },
        cursorColor: Color.fromARGB(255, 32, 109, 35),
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Courier',
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.phone,
            color: Color.fromARGB(255, 32, 109, 35),
          ),
          labelText: 'Telefono', // Texto del marcador
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 32, 109, 35),
          ), // Estilo del marcador
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
        ),
      ),
    );
  }
}

class _containerCI extends StatelessWidget {
  const _containerCI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registreFormBloc =
        BlocProvider.of<RegistreFormBloc>(context, listen: true);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10, left: 10),
      margin: EdgeInsets.symmetric(horizontal: 45),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          registreFormBloc.add(OnChangedCI(int.tryParse(value)!));
        },
        cursorColor: Color.fromARGB(255, 32, 109, 35),
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Courier',
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.credit_card,
            color: Color.fromARGB(255, 32, 109, 35),
          ),
          labelText: 'CI', // Texto del marcador
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 32, 109, 35),
          ), // Estilo del marcador
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
        ),
      ),
    );
  }
}

class _containerNombre extends StatelessWidget {
  const _containerNombre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registreFormBloc =
        BlocProvider.of<RegistreFormBloc>(context, listen: true);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 10, left: 10),
      margin: EdgeInsets.symmetric(horizontal: 45),
      child: TextFormField(
        onChanged: (value) {
          registreFormBloc.add(OnChangedNombre(value));
        },
        cursorColor: Color.fromARGB(255, 32, 109, 35),
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Courier',
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 32, 109, 35),
          ),
          labelText: 'Nombre', // Texto del marcador
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 32, 109, 35),
          ), // Estilo del marcador
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 32, 109, 35)),
          ),
        ),
      ),
    );
  }
}
