part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  const GpsState({
    this.isGpsEnabled = false,
    this.isGpsPermissionGranted = false,
  });

  GpsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) {
    return GpsState(
      isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
      isGpsPermissionGranted:
          isGpsPermissionGranted ?? this.isGpsPermissionGranted,
    );
  }

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];
}
