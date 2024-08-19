import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notification/bloc/map/map_bloc.dart';

class MapView extends StatefulWidget {
  final LatLng initialLocation;

  const MapView({super.key, required this.initialLocation});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapBloc? mapBloc;

  @override
  void initState() {
    mapBloc = BlocProvider.of<MapBloc>(context);
    mapBloc!.add(OnInsertMarker());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition =
        CameraPosition(target: widget.initialLocation, zoom: 15);
    final size = MediaQuery.of(context).size;

    final Set<Marker> markers = mapBloc!.state.markers.values.toSet();

    return SizedBox(
        width: size.width,
        height: size.height,
        child: GoogleMap(
          markers: markers,
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
          compassEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) =>
              mapBloc!.add(OnMapInitialized(controller)),
        ),
        
        );
  }
}
