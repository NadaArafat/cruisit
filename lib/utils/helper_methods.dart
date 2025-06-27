import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruisit/features/explore/data/models/destination_model.dart';
import 'package:cruisit/features/explore/presentation/views/see_all_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

String getNameFromDocumentRef({required DocumentReference<Object?>? ref}) {
  return ref.toString().split('/').last.split(')').first;
}

Widget buildCategoryHeader({
  required String title,
  required void Function()? onSeeAllPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onSeeAllPressed,
          child: const Text(
            'See All',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    ),
  );
}

void navigateToSeeAllView(context,{required String title, required List<DestinationModel> destinations}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SeeAllView(
        destinations: destinations, title: title,
      ),
    ),
  );
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
