import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/foundation.dart';

Future<String> urlCloudinary(file) async {
  File fileBytes = File(file.path);
  final cloudinary = Cloudinary.signedConfig(
    apiKey: 'h6lb1iQebGIwHMfsoVPBO61dyvI',
    apiSecret: '422253887739587',
    cloudName: 'da9xsfose',
  );
  
  final response = await cloudinary.upload(
    file: file.path,
    resourceType: CloudinaryResourceType.image,
    optParams: {
      'public_id': 'holaMundo',
      'overwrite': true,
    },
    publicId: 'asd',
    progressCallback: (count, total) {
      if (kDebugMode) {
        print('Uploading image from file with progress: $count/$total');
      }
    },
    fileBytes: fileBytes.readAsBytesSync(),
  );
  if (response.isSuccessful) {
    /* print('Get your image from with ${response.secureUrl}'); */
    late String? image = response.secureUrl;
    if (kDebugMode) {
      print("imagen url: $image");
    }
    return image!;
  } else {
    if (kDebugMode) {
      print("error");
    }
    return "error";
  }
}
