import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/clients_controller.dart';
import '../database/database.dart';
import '../translate/strings.dart';

class FullScreenDialogEditClient extends StatefulWidget {
  const FullScreenDialogEditClient({super.key, required this.client});

  final ClientsTableData client;

  @override
  State<FullScreenDialogEditClient> createState() => _FullScreenDialogEditClientState();
}

class _FullScreenDialogEditClientState extends State<FullScreenDialogEditClient> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController preferencesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.client.name;
    phoneNumberController.text = widget.client.phoneNumber;
    addressController.text = widget.client.address;
    preferencesController.text = widget.client.preferences;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ClientsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.edit_client_title)),
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
                label: Text(Translate.getString(Texts.name)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.person),
              ),
              controller: nameController,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(Translate.getString(Texts.phone_number)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.phone),
              ),
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(Translate.getString(Texts.address)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.location_on),
              ),
              controller: addressController,
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(Translate.getString(Texts.preferences)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.edit),
              ),
              controller: preferencesController,
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  if (nameController.text.isEmpty || addressController.text.isEmpty || phoneNumberController.text.isEmpty) {
                    return;
                  }

                  controller.updateClient(
                    widget.client.id,
                    nameController.text,
                    phoneNumberController.text,
                    addressController.text,
                    preferencesController.text,
                  );
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                  elevation: WidgetStatePropertyAll(5),
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.blue,
                  ),
                ),
                child: Text(
                  Translate.getString(Texts.save),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
