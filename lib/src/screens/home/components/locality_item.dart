import 'package:coupure_info/src/logic/models/locality.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalityItem extends StatelessWidget {
  final Locality locality;

  const LocalityItem({super.key, required this.locality});

  @override
  Widget build(BuildContext context) {
    final formattedStartDate = DateFormat(
      'd MMMM y à HH:mm',
      'fr_FR',
    ).format(locality.startDate);
    final formattedEndDate = DateFormat(
      'd MMMM y à HH:mm',
      'fr_FR',
    ).format(locality.endDate);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locality.quarter,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_city, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  locality.city,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Début: $formattedStartDate',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Fin: $formattedEndDate',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (locality.observations.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Observations:',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                locality.observations,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
