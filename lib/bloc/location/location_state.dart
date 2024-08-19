part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool folowingUser;

  //Ultima ubicacion que conozco del usuario
  final LatLng? latKnowLocation;

  final List<LatLng> myLocationHisyory;

  const LocationState(
      {this.folowingUser = false, this.latKnowLocation, myLocationHisyory})
      : myLocationHisyory = myLocationHisyory ??
            const []; // El valor por defecto de folowingUser es true

  LocationState copyWith({
    bool? folowingUser,
    LatLng? latKnowLocation,
    List<LatLng>? myLocationHisyory,
  }) =>
      LocationState(
        folowingUser: folowingUser ?? this.folowingUser,
        latKnowLocation: latKnowLocation ?? this.latKnowLocation,
        myLocationHisyory: myLocationHisyory ?? this.myLocationHisyory,
      );

  @override
  List<Object?> get props => [folowingUser, latKnowLocation, myLocationHisyory];
}
