import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/location/location_bloc.dart';
import 'package:notification/bloc/map/map_bloc.dart';
import 'package:notification/presentation/screens/custom_snackbar.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 25,
          child: IconButton(
            icon: Icon(
              Icons.my_location_outlined,
              color: Color.fromARGB(255, 32, 109, 35),
            ),
            onPressed: () {
              final userLocation = locationBloc.state.latKnowLocation;
              if (userLocation == null) {
                final snack = CustomSnackBar(message: 'No hay ubicación');
                ScaffoldMessenger.of(context).showSnackBar(snack);
                return;
              }
              mapBloc.moveCamera(userLocation);
            },
          ),
        ));
  }
}
