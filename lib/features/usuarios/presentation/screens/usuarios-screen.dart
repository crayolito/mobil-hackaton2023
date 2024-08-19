import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/bloc/usuarios/usuarios_bloc.dart';

class UsuariosPagee extends StatefulWidget {
  const UsuariosPagee({super.key});

  @override
  State<UsuariosPagee> createState() => _UsuariosPageeState();
}

class _UsuariosPageeState extends State<UsuariosPagee> {
  UsuariosBloc? usuariosBloc;
  AuthBloc? authBloc;

  @override
  void initState() {
    super.initState();
    // authBloc = BlocProvider.of<AuthBloc>(context, listen: false);
    // usuariosBloc = BlocProvider.of<UsuariosBloc>(context, listen: false);
    // usuariosBloc!.add(OnGetUsuarios(authBloc!.state.usuario!.idPersona));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'lista');
              },
              icon: Icon(Icons.list_alt_rounded))
        ],
      ),
      body: ContentUsuarios(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          publicacionBloc.add(OnChagendeType(Type.publicacion));
          Navigator.pushNamed(context, 'publicacion');
        },
        child: Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

class ContentUsuarios extends StatefulWidget {
  const ContentUsuarios({
    super.key,
  });

  @override
  State<ContentUsuarios> createState() => _ContentUsuariosState();
}

class _ContentUsuariosState extends State<ContentUsuarios> {
  @override
  Widget build(BuildContext context) {
    final usuariosBloc = BlocProvider.of<UsuariosBloc>(context, listen: true);
    final publicacionBloc =
        BlocProvider.of<PublicacionBloc>(context, listen: true);

    return Container(
      child: Center(
        child: ListView.builder(
          itemCount: usuariosBloc.state.usuarios.length,
          itemBuilder: (context, index) {
            return Container();
          },
        ),
      ),
    );
  }
}



// CheckboxListTile(
//               value: publicacionBloc.state.paraQuienes
//                   .contains(usuariosBloc.state.usuarios[index].idPersona),
//               onChanged: (value) {
//                 setState(() {
//                   if (value == true) {
//                     publicacionBloc.add(OnAddParaQuines(
//                         usuariosBloc.state.usuarios[index].idPersona));
//                   } else {
//                     publicacionBloc.add(OnRemoveParaQuines(
//                         usuariosBloc.state.usuarios[index].idPersona));
//                   }
//                 });
//               },
//               title: Text(usuariosBloc.state.usuarios[index].nombre),
//             )