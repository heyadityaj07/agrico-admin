// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';
import 'dart:convert';
import 'package:agricoo_admin/app_state.dart';
import 'package:agricoo_admin/flutter_flow/lat_lng.dart';
import 'package:http/http.dart' as http;

Future<String> getAddressFromLatLng(LatLng address) async {
  // Add your function code here!
  // print("address $address");
  // final Geocoding geocoding = Geocoding();

  // try {
  //   final placemarks = await geocoding.placemarkFromCoordinates(
  //     address.latitude,
  //     address.longitude,
  //   );

  //   if (placemarks.isEmpty) return "";

  //   final p = placemarks.first;

  //   // ✅ street = [street or name, thoroughfare, subLocality]
  //   final streetParts = <String>[
  //     ((p.street ?? "").trim().isNotEmpty)
  //         ? (p.street ?? "").trim()
  //         : (p.name ?? "").trim(),
  //     (p.thoroughfare ?? "").trim(),
  //     (p.subLocality ?? "").trim(),
  //   ].where((x) => x.isNotEmpty).toList();

  //   final street = streetParts.join(", ");

  //   final city = (p.locality ?? "").trim();
  //   final state = (p.administrativeArea ?? "").trim();
  //   final zip = (p.postalCode ?? "").trim();
  //   final country = (p.country ?? "").trim();

  //   // ✅ full address string (optional)
  //   final fullParts = <String>[
  //     street,
  //     city,
  //     state,
  //     zip,
  //     country,
  //   ].where((x) => x.isNotEmpty).toList();

  //   final fullAddress = fullParts.join(", ");
  //   debugPrint("fullAddress: $fullAddress");

  //   // ✅ Save in AppState
  //   FFAppState().updateFarmlocationStruct((e) => e
  //     ..street = street
  //     ..city = city
  //     ..state = state
  //     ..zipcode = zip
  //     ..country = country);
  //   debugPrint("fullAddress $fullAddress");
  //   return fullAddress;
  // } catch (_) {
  //   return "";
  // }
  print("address $address");

  try {
    // Make an HTTP request to OpenStreetMap's free Nominatim Geocoding API
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${address.latitude}&lon=${address.longitude}&zoom=18&addressdetails=1');

    final response = await http.get(url, headers: {
      'User-Agent': 'agricoo_admin_app', // Required by OpenStreetMap terms
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data != null && data['address'] != null) {
        final addressMap = data['address'];

        final street = addressMap['road'] ??
            addressMap['pedestrian'] ??
            addressMap['street'] ??
            '';
        final city = addressMap['city'] ??
            addressMap['town'] ??
            addressMap['village'] ??
            '';
        final state = addressMap['state'] ?? '';
        final zip = addressMap['postcode'] ?? '';
        final country = addressMap['country'] ?? '';

        final fullParts = <String>[
          street,
          city,
          state,
          zip,
          country,
        ].where((x) => x.isNotEmpty).toList();

        final fullAddress = fullParts.join(", ");
        debugPrint("fullAddress: $fullAddress");

        // Save in AppState
        FFAppState().updateFarmlocationStruct((e) => e
          ..street = street
          ..city = city
          ..state = state
          ..zipcode = zip
          ..country = country);

        return fullAddress;
      }
    }
    return "";
  } catch (e) {
    print("Error getting address: $e");
    return "";
  }
}
