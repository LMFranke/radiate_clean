import 'package:flutter/material.dart';
import 'package:readiate_clean/database/database.dart';
import 'package:readiate_clean/translate/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenDialogInfoClient extends StatelessWidget {
  const FullScreenDialogInfoClient({super.key, required this.client});
  final ClientsTableData client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.client)),
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
                hintText: client.name,
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.person),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: client.phoneNumber,
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  tooltip: Translate.getString(Texts.make_call_tip),
                  onPressed: () {
                    _makePhoneCall(client.phoneNumber);
                  },
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: client.address,
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.location_on),
              ),
              readOnly: true,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: client.preferences,
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.edit),
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.trim(),
    );
    if (!await launchUrl(launchUri)) {
      throw Exception('Error while trying to realize the call $phoneNumber');
    }
  }

}
