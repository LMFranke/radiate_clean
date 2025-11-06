import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/components/snack_bar_info.dart';

import '../controller/clients_controller.dart';
import '../translate/strings.dart';

class FullScreenDialogAddClient extends StatefulWidget {
  const FullScreenDialogAddClient({super.key});

  @override
  State<FullScreenDialogAddClient> createState() => _FullScreenDialogAddClientState();

}

class _FullScreenDialogAddClientState extends State<FullScreenDialogAddClient> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController preferencesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ClientsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.add_client_title)),
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

                  controller.addClient(
                    nameController.text,
                    addressController.text,
                    phoneNumberController.text,
                    preferencesController.text,
                  ).then((value) {
                    SnackBarInfo(
                        text: Translate.getString(Texts.success_add_client),
                        context: context,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                      );
                  },);
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
                  Translate.getString(Texts.add),
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
