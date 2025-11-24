import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/components/util/snack_bar_info.dart';
import 'package:readiate_clean/controller/event_controller.dart';
import 'package:readiate_clean/database/database.dart';

import '../../model/enum/enum_type_of_work.dart';
import '../../translate/strings.dart';

class FullScreenDialogAddEvent extends StatefulWidget {
  const FullScreenDialogAddEvent({super.key});

  @override
  State<FullScreenDialogAddEvent> createState() =>
      _FullScreenDialogAddEventState();
}

class _FullScreenDialogAddEventState extends State<FullScreenDialogAddEvent> {
  final TextEditingController pickerDateController = TextEditingController();

  TypeOfWork selectedType = TypeOfWork.allDay;
  Frequency selectedFrequency = Frequency.unique;

  ClientsTableData? selectedClient;
  ServiceTableData? selectedService;

  @override
  Widget build(BuildContext context) {
    final eventController = context.read<EventController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.add_event_title)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: eventController.getDropButtonClients(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      Translate.getString(Texts.error_to_load_clients),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: Translate.getString(
                          Texts.no_data_found_client,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  } else {
                    final clients = snapshot.data!;

                    return DropdownButtonFormField(
                      initialValue: selectedClient,
                      hint: Text(Translate.getString(Texts.select_client)),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: Translate.getString(Texts.client),
                      ),
                      items: clients.map((ClientsTableData client) {
                        return DropdownMenuItem<ClientsTableData>(
                          value: client,
                          child: Text(client.name),
                        );
                      }).toList(),
                      onChanged: (clientSelected) {
                        setState(() {
                          selectedClient = clientSelected;
                          eventController.selectedClient = clientSelected;
                        });
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                future: eventController.getDropButtonServices(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      Translate.getString(Texts.error_to_load_services),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: Translate.getString(
                          Texts.no_data_found_service,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  } else {
                    final services = snapshot.data!;

                    return DropdownButtonFormField(
                      value: selectedService,
                      hint: Text(Translate.getString(Texts.select_service)),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: services.map((ServiceTableData service) {
                        return DropdownMenuItem<ServiceTableData>(
                          value: service,
                          child: Text(service.description),
                        );
                      }).toList(),
                      onChanged: (serviceSelected) {
                        setState(() {
                          selectedService = serviceSelected;
                          eventController.selectedService = serviceSelected;
                        });
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(Translate.getString(Texts.do_a_description)),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: const Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: 35),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(Translate.getString(Texts.select_date)),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                controller: pickerDateController,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  ).then((dateSelected) {
                    pickerDateController.text =
                        "${dateSelected?.day}/${dateSelected?.month}/${dateSelected?.year}";
                    eventController.selectedDate = dateSelected;
                  });
                },
              ),
              const SizedBox(height: 25),
              Text(
                Translate.getString(Texts.select_work_type),
                style: const TextStyle(fontSize: 18),
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return SegmentedButton(
                    segments: [
                      ButtonSegment(
                        value: TypeOfWork.allDay,
                        label: Text(Translate.getString(Texts.all_day)),
                        icon: const Icon(Icons.sunny),
                      ),
                      ButtonSegment(
                        value: TypeOfWork.halfDay,
                        label: Text(Translate.getString(Texts.half_day)),
                        icon: const Icon(Icons.sunny_snowing),
                      ),
                    ],
                    selected: <TypeOfWork>{selectedType},
                    onSelectionChanged: (Set p0) {
                      setState(() {
                        selectedType = p0.first;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 25),
              Text(
                Translate.getString(Texts.select_frequency),
                style: const TextStyle(fontSize: 18),
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return SegmentedButton(
                    segments: [
                      ButtonSegment(
                        value: Frequency.unique,
                        label: Text(
                          Translate.getString(Texts.frequency_unique),
                        ),
                        icon: const Icon(Icons.event),
                      ),
                      ButtonSegment(
                        value: Frequency.weekly,
                        label: Text(
                          Translate.getString(Texts.frequency_weekly),
                        ),
                        icon: const Icon(Icons.calendar_view_week),
                      ),
                      ButtonSegment(
                        value: Frequency.monthly,
                        label: Text(
                          Translate.getString(Texts.frequency_monthly),
                        ),
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                    selected: <Frequency>{selectedFrequency},
                    onSelectionChanged: (Set p0) {
                      setState(() {
                        selectedFrequency = p0.first;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (eventController.validateInput(context)) {
                      eventController
                          .addEvent(selectedType, selectedFrequency)
                          .then((value) {
                            if (context.mounted) {
                              Navigator.pop(context);

                              SnackBarInfo(
                                text: Translate.getString(
                                  Texts.success_add_event,
                                ),
                                context: context,
                                textColor: Colors.white,
                                backgroundColor: Colors.green,
                              );
                            }
                          });
                    }
                  },
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                    elevation: WidgetStatePropertyAll(5),
                    backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                  ),
                  child: Text(
                    Translate.getString(Texts.create),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
