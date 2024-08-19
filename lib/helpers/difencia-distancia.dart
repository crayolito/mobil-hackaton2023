import 'package:geolocator/geolocator.dart';

class DifenciaDistancia {
  double calcularDistancia(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    // Calcula la distancia entre los dos puntos en metros
    double distanceInMeters = Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);

    // Convierte la distancia a kilómetros
    double distanceInKilometers = distanceInMeters / 1000;

    return distanceInKilometers;
  }
}
