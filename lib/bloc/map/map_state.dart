part of 'map_bloc.dart';

// ignore: must_be_immutable
class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  Map<String ,Polyline> polylines = {}; 
  Map<String, Marker> markers = {};

  MapState({
    this.isMapInitialized = false,
    this.followUser = false,
    Map<String, Marker>? markers,
  }) : markers = markers ?? {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    Map<String, Marker>? markers,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        followUser: followUser ?? this.followUser,
        markers: markers ?? this.markers,
      );

  @override
  List<Object> get props => [isMapInitialized, followUser, markers];
}
