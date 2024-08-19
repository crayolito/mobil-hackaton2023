import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(LocationState()) {
    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(
        latKnowLocation: event.newLocation,
        myLocationHisyory: [
          ...state.myLocationHisyory,
          event.newLocation,
        ],
      ));
    });
    on<OnStartFolowingUser>((event, emit) {
      emit(state.copyWith(folowingUser: true));
    });
    on<OnStopFolowingUser>((event, emit) {
      emit(state.copyWith(folowingUser: false));
    });
  }

  Future<String> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String resultado = '';
    resultado += placemarks[0].thoroughfare.toString() != ''
        ? '${placemarks[0].thoroughfare.toString()} | '
        : '';
    resultado += placemarks[0].subLocality.toString() != ''
        ? '${placemarks[0].subLocality.toString()} | '
        : '';
    resultado += placemarks[0].subThoroughfare.toString() != ''
        ? '${placemarks[0].subThoroughfare.toString()} | '
        : '';
    return resultado;
  }

  Future<Position> getActualLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  void startFollowingUser() {
    add(OnStartFolowingUser());
    positionStream = Geolocator.getPositionStream().listen((event) {
      final posititon = event;
      add(OnNewUserLocationEvent(
        LatLng(posititon.latitude, posititon.longitude),
      ));
    });
  }

  void stopFolowwingUser() {
    positionStream!.cancel();
    add(OnStopFolowingUser());
  }

  @override
  Future<void> close() {
    stopFolowwingUser();
    return super.close();
  }
}
