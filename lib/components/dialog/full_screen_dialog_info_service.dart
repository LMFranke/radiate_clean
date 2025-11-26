import 'package:flutter/material.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/translate/strings.dart';

class FullScreenDialogInfoService extends StatelessWidget {
  const FullScreenDialogInfoService({super.key, required this.service});

  final ServiceTableData service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.service)),
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
              initialValue: service.description,
              decoration: InputDecoration(
                labelText: Translate.getString(Texts.description),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.description),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              initialValue: "R\$ ${service.allDayValue.toStringAsFixed(2)}",
              decoration: InputDecoration(
                labelText: Translate.getString(Texts.value_all_day),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.attach_money),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              initialValue: "R\$ ${service.halfDayValue.toStringAsFixed(2)}",
              decoration: InputDecoration(
                labelText: Translate.getString(Texts.value_half_day),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.money_off),
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}