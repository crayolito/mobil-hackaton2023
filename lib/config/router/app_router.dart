import 'package:flutter/widgets.dart';
import 'package:notification/features/auth/presentation/screens/home_screen.dart';
import 'package:notification/features/auth/presentation/screens/login_screen.dart';
import 'package:notification/features/auth/presentation/screens/perfil_screen.dart';
import 'package:notification/features/notificacion/presentation/screens/notificacion-screen.dart';
import 'package:notification/features/publicacion/presentation/screens/create-publicacion-screen.dart';
import 'package:notification/features/publicacion/presentation/screens/list-notificacion-screen.dart';
import 'package:notification/features/usuarios/presentation/screens/usuarios-screen.dart';
import 'package:notification/presentation/screens/alerta_screen.dart';
import 'package:notification/presentation/screens/categorias_selection.dart';
import 'package:notification/presentation/screens/map_screen.dart';
import 'package:notification/presentation/screens/poster_screen.dart';
import 'package:notification/features/auth/presentation/screens/registre_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (_) => HomeScreen(),
  'prueba': (_) => PosterComisaria(),
  'categorias': (_) => CategoriasSelection(),
  'mapaPolicial': (_) => MapsScreen(),
  'registre': (_) => RegistreScreen(),
  'login': (_) => LoginScreen(),
  'usuarios': (_) => UsuariosPagee(),
  'lista': (_) => ListPublicacionsPage(),
  'chatSala': (_) => SalaNotificacion(),
  'publicacion': (_) => PublicacionPage(),
  'perfil': (_) => PerfilScreen(),
  'comisaria': (_) => PublicacionPage(),
  'posterPatrulla': (_) => PosterComisaria(),
  'alerta': (_) => AlertaScreen()
};
