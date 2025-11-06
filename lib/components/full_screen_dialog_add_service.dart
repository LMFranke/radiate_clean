import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/controller/services_controller.dart';
import 'package:readiate_clean/translate/strings.dart';

class FullScreenDialogAddService extends StatefulWidget {
  const FullScreenDialogAddService({super.key});

  @override
  State<FullScreenDialogAddService> createState() => _FullScreenDialogAddServiceState();
}

class _FullScreenDialogAddServiceState extends State<FullScreenDialogAddService> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController allDayValueController = TextEditingController();
  final TextEditingController halfDayValueController = TextEditingController();

  double _allDayValue = 0;
  double _halfDayValue = 0;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ServicesController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.add_service_title)),
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
                suffixIcon: const Icon(Icons.monetization_on_outlined),
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
                suffixIcon: const Icon(Icons.monetization_on_outlined),
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

                    controller.addService(descriptionController.text, _allDayValue, _halfDayValue,).then(
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
                      },
                    );
                    Navigator.pop(context);
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
