import 'package:coupure_info/src/logic/models/locality.dart';
import 'package:flutter/material.dart';

class LocalityItem extends StatelessWidget {
  const LocalityItem({super.key, required this.locality});

  final Locality locality;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locality.city,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(locality.observations),
            const SizedBox(height: 8),
            Text(
              'Nombre d\'habitants : ${locality.quarter}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // build Dates
            Text(
              'Dates : ${locality.startDate} - ${locality.endDate}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
