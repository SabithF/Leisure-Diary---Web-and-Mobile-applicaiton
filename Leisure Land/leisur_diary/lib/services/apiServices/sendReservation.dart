import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/reservation.dart';

Future<void> sendReservation(Reservation reservation) async {
  final String apiUrl = 'http://192.168.8.188/api/Reservations';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(reservation.toJson()),
  );

  if (response.statusCode == 200) {
    print('Reservation sent to backend');
  } else {
    // Error sending reservation to backend
    print('Error sending reservation to backend');
  }
}
