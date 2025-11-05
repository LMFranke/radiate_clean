import 'package:flutter/material.dart';
import 'package:readiate_clean/components/list_view_clients.dart';
import 'package:readiate_clean/controller/clients_controller.dart';
import 'package:readiate_clean/translate/strings.dart';

class ClientsScreen extends StatefulWidget {
  ClientsScreen({super.key, required this.clientsController});

  final ClientsController clientsController;

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  void initState() {
    super.initState();
    widget.clientsController.getAllClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.getString(Texts.client_title)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListenableBuilder(
              listenable: widget.clientsController,
              builder: (context, child) => ListViewClients(
                clientList: widget.clientsController.customerList,
                controller: widget.clientsController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
