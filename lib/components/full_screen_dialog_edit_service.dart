import 'package:flutter/material.dart';
import 'package:readiate_clean/database/database.dart';

import '../controller/services_controller.dart';
import '../translate/strings.dart';

class FullScreenDialogEditService extends StatefulWidget {
  const FullScreenDialogEditService({super.key, required this.controller, required this.service});

  final ServicesController controller;
  final ServiceTableData service;

  @override
  State<FullScreenDialogEditService> createState() => _FullScreenDialogEditServiceState();
}

class _FullScreenDialogEditServiceState extends State<FullScreenDialogEditService> {

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController allDayValueController = TextEditingController();
  final TextEditingController halfDayValueController = TextEditingController();

  double _allDayValue = 0;
  double _halfDayValue = 0;

  @override
  void initState() {
    super.initState();

    descriptionController.text = widget.service.description;
    allDayValueController.text = "${widget.service.allDayValue}";
    halfDayValueController.text = "${widget.service.halfDayValue}";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.edit_service_title)),
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
                label: Text(Translate.getString(Texts.description)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.person),
              ),
              controller: descriptionController,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(Translate.getString(Texts.value_all_day)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.phone),
              ),
              controller: allDayValueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text(Translate.getString(Texts.value_half_day)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.location_on),
              ),
              controller: halfDayValueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  try {
                    _allDayValue = double.parse(allDayValueController.text);
                    _halfDayValue = double.parse(halfDayValueController.text);

                    widget.controller.updateService(
                      widget.service.id,
                      descriptionController.text,
                      _allDayValue,
                      _halfDayValue,
                    ).then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              Translate.getString(Texts.success_add_service),
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                  elevation: WidgetStatePropertyAll(5),
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.blue,
                  ),
                ),
                child: Text(
                  Translate.getString(Texts.edit),
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
