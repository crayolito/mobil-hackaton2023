import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:notification/marker/marker.dart';

Future<ui.Image> loadImage(String assetPath,
    {int width = 100, int height = 80}) async {
  final data = await rootBundle.load(assetPath);
  final bytes = data.buffer.asUint8List();
  final codec = await ui.instantiateImageCodec(bytes,
      targetWidth: width, targetHeight: height);
  final frame = await codec.getNextFrame();
  return frame.image;
}

Future<BitmapDescriptor> getCustomMarker() async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(350, 150);
  ui.Image? image = await loadImage('assets/images/policia.png');
  final marker = MarkerPainter(image);
  marker.paint(canvas, size);

  final picture = recorder.endRecording();
  final imageMarker =
      await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteData = await imageMarker.toByteData(format: ui.ImageByteFormat.png);
  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}
