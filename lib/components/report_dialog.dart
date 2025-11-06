import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:readiate_clean/translate/strings.dart';

import '../controller/report_controller.dart';

class ReportFilterDialog extends StatefulWidget {
  const ReportFilterDialog({super.key});

  @override
  State<ReportFilterDialog> createState() => _ReportFilterDialogState();
}

class _ReportFilterDialogState extends State<ReportFilterDialog> {
  ReportType _selectedType = ReportType.byClient;
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _endDate = DateTime.now();

  final DateFormat _dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Translate.getString(Texts.report_filter)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<ReportType>(
            initialValue: _selectedType,
            items: [
              DropdownMenuItem(
                value: ReportType.byClient,
                child: Text(Translate.getString(Texts.filter_by_client)),
              ),
              DropdownMenuItem(
                value: ReportType.byService,
                child: Text(Translate.getString(Texts.filter_by_service)),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedType = value;
                });
              }
            },
            decoration: InputDecoration(
              labelText: Translate.getString(Texts.group_by),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Translate.getString(Texts.start_date)),
              TextButton(
                child: Text(_dateFormatter.format(_startDate)),
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _startDate = pickedDate;
                    });
                  }
                },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Translate.getString(Texts.end_date)),
              TextButton(
                child: Text(_dateFormatter.format(_endDate)),
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _endDate,
                    firstDate: _startDate,
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _endDate = pickedDate;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(Translate.getString(Texts.cancel)),
        ),
        FilledButton(
          onPressed: () {
            context.read<ReportController>().generateReport(
              reportType: _selectedType,
              startDate: _startDate,
              endDate: _endDate,
            );
            Navigator.of(context).pop();
          },
          child: Text(Translate.getString(Texts.apply)),
        ),
      ],
    );
  }
}
