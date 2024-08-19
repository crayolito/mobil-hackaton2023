import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/location/location_bloc.dart';
import 'package:notification/presentation/screens/btn_location.dart';
import 'package:notification/presentation/screens/map_view.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LocationBloc? locationBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context, listen: false);
    // locationBloc.getCurrentLocation();
    locationBloc!.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc!.stopFolowwingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.latKnowLocation == null)
            return Center(
              child: Text('Espere por favor ...'),
            );

          return SingleChildScrollView(
            child: Stack(
              children: [
                MapView(
                  initialLocation: state.latKnowLocation!,
                )
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [BtnCurrentLocation()],
      ),
    );
  }
}
