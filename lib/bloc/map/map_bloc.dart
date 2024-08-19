import 'dart:convert';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notification/helpers/widgets_to_marker.dart';
import 'package:notification/presentation/screens/poster_screen.dart';
import 'package:notification/theme/mapTheme.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? _mapController;

  MapBloc() : super(MapState()) {
    on<OnMapInitialized>(_onInitMap);
    on<OnInsertMarker>((event, emit) async {
      List<LatLng> coordenadas = [
        const LatLng(-17.731607, -63.104543),
        const LatLng(-17.847289, -63.187109),
        const LatLng(-17.829494, -63.238932),
        const LatLng(-17.827123, -63.225783),
        const LatLng(-17.825925, -63.133964),
        const LatLng(-17.791295, -63.137818),
        const LatLng(-17.772024, -63.127302),
        const LatLng(-17.812801, -63.182134),
        const LatLng(-17.801080, -63.195785),
        const LatLng(-17.796429, -63.166154),
        const LatLng(-17.796154, -63.182638),
        const LatLng(-17.787798, -63.199621),
        const LatLng(-17.787217, -63.211206),
        const LatLng(-17.770546, -63.184558),
        const LatLng(-17.756214, -63.200906),
      ];

      final currentMarkers = Map<String, Marker>.from(state.markers);
      final imageMarker = await getCustomMarker();
      coordenadas.asMap().forEach((index, value) {
        final marker = Marker(
          markerId: MarkerId(index.toString()),
          position: value,
          icon: imageMarker,
          anchor: Offset(0, 0),
          onTap: () {
            print('HOLA');
            Get.to(PosterComisaria());
          },
        );
        currentMarkers[index.toString()] = marker;
      });

      emit(state.copyWith(markers: currentMarkers));
    });
  }

  void _onInitMap(OnMapInitialized event, Emitter<MapState> emit) {
    _mapController = event.mapController;
    _mapController!.setMapStyle(jsonEncode(mapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController!.animateCamera(cameraUpdate);
  }
}
