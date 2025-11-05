import 'package:flutter/material.dart';
import 'package:readiate_clean/model/event.dart';

import '../translate/strings.dart';

class FullScreenDialogInfoEvent extends StatelessWidget {

  const FullScreenDialogInfoEvent({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.event)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: event.client.name,
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: event.service.description,
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.cleaning_services),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "${event.serviceScheduled.date.day}/${event.serviceScheduled.date.month}/${event.serviceScheduled.date.year}",
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.date_range),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "R\$ ${event.serviceScheduled.isHalfDay == 1
                    ? event.service.halfDayValue.toString()
                    : event.service.allDayValue.toString()}",
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.monetization_on),
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
