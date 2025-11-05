import 'package:flutter/material.dart';
import 'package:readiate_clean/database/database.dart';

class DatabaseProvider extends InheritedWidget {
  final MyDatabase database;

  const DatabaseProvider({
    super.key,
    required this.database,
    required super.child,
  });

  static MyDatabase of(BuildContext context) {
    final DatabaseProvider? provider = context.dependOnInheritedWidgetOfExactType<DatabaseProvider>();
    assert(provider != null, 'DatabaseProvider no found in context.');
    return provider!.database;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }


}
