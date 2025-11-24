import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readiate_clean/components/util/appbar_app.dart';
import 'package:readiate_clean/components/list_view_clients.dart';
import 'package:readiate_clean/controller/clients_controller.dart';
import 'package:readiate_clean/translate/strings.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ClientsController>().getAllClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Texts.client_title),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Consumer<ClientsController>(
          builder: (context, controller, child) {
            return ListViewClients(
              clientList: controller.customerList,
            );
          },
        ),
      ),
    );
  }
}
