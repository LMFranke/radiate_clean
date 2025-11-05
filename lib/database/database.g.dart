// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notificationDateTimeMeta =
      const VerificationMeta('notificationDateTime');
  @override
  late final GeneratedColumn<DateTime> notificationDateTime =
      GeneratedColumn<DateTime>('notification_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, password, email, notificationDateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('notification_date_time')) {
      context.handle(
          _notificationDateTimeMeta,
          notificationDateTime.isAcceptableOrUnknown(
              data['notification_date_time']!, _notificationDateTimeMeta));
    } else if (isInserting) {
      context.missing(_notificationDateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      notificationDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}notification_date_time'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String password;
  final String email;
  final DateTime notificationDateTime;
  const UserTableData(
      {required this.id,
      required this.name,
      required this.password,
      required this.email,
      required this.notificationDateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['password'] = Variable<String>(password);
    map['email'] = Variable<String>(email);
    map['notification_date_time'] = Variable<DateTime>(notificationDateTime);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      password: Value(password),
      email: Value(email),
      notificationDateTime: Value(notificationDateTime),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      password: serializer.fromJson<String>(json['password']),
      email: serializer.fromJson<String>(json['email']),
      notificationDateTime:
          serializer.fromJson<DateTime>(json['notificationDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'password': serializer.toJson<String>(password),
      'email': serializer.toJson<String>(email),
      'notificationDateTime': serializer.toJson<DateTime>(notificationDateTime),
    };
  }

  UserTableData copyWith(
          {int? id,
          String? name,
          String? password,
          String? email,
          DateTime? notificationDateTime}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
        email: email ?? this.email,
        notificationDateTime: notificationDateTime ?? this.notificationDateTime,
      );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      password: data.password.present ? data.password.value : this.password,
      email: data.email.present ? data.email.value : this.email,
      notificationDateTime: data.notificationDateTime.present
          ? data.notificationDateTime.value
          : this.notificationDateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('notificationDateTime: $notificationDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, password, email, notificationDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.password == this.password &&
          other.email == this.email &&
          other.notificationDateTime == this.notificationDateTime);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> password;
  final Value<String> email;
  final Value<DateTime> notificationDateTime;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.password = const Value.absent(),
    this.email = const Value.absent(),
    this.notificationDateTime = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String password,
    required String email,
    required DateTime notificationDateTime,
  })  : name = Value(name),
        password = Value(password),
        email = Value(email),
        notificationDateTime = Value(notificationDateTime);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? password,
    Expression<String>? email,
    Expression<DateTime>? notificationDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
      if (notificationDateTime != null)
        'notification_date_time': notificationDateTime,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? password,
      Value<String>? email,
      Value<DateTime>? notificationDateTime}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      notificationDateTime: notificationDateTime ?? this.notificationDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (notificationDateTime.present) {
      map['notification_date_time'] =
          Variable<DateTime>(notificationDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('notificationDateTime: $notificationDateTime')
          ..write(')'))
        .toString();
  }
}

class $ClientsTableTable extends ClientsTable
    with TableInfo<$ClientsTableTable, ClientsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _preferencesMeta =
      const VerificationMeta('preferences');
  @override
  late final GeneratedColumn<String> preferences = GeneratedColumn<String>(
      'preferences', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
      'is_active', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phoneNumber, address, preferences, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients_table';
  @override
  VerificationContext validateIntegrity(Insertable<ClientsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('preferences')) {
      context.handle(
          _preferencesMeta,
          preferences.isAcceptableOrUnknown(
              data['preferences']!, _preferencesMeta));
    } else if (isInserting) {
      context.missing(_preferencesMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      preferences: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preferences'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_active']),
    );
  }

  @override
  $ClientsTableTable createAlias(String alias) {
    return $ClientsTableTable(attachedDatabase, alias);
  }
}

class ClientsTableData extends DataClass
    implements Insertable<ClientsTableData> {
  final int id;
  final String name;
  final String phoneNumber;
  final String address;
  final String preferences;
  final int? isActive;
  const ClientsTableData(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.address,
      required this.preferences,
      this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['address'] = Variable<String>(address);
    map['preferences'] = Variable<String>(preferences);
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<int>(isActive);
    }
    return map;
  }

  ClientsTableCompanion toCompanion(bool nullToAbsent) {
    return ClientsTableCompanion(
      id: Value(id),
      name: Value(name),
      phoneNumber: Value(phoneNumber),
      address: Value(address),
      preferences: Value(preferences),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
    );
  }

  factory ClientsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      address: serializer.fromJson<String>(json['address']),
      preferences: serializer.fromJson<String>(json['preferences']),
      isActive: serializer.fromJson<int?>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'address': serializer.toJson<String>(address),
      'preferences': serializer.toJson<String>(preferences),
      'isActive': serializer.toJson<int?>(isActive),
    };
  }

  ClientsTableData copyWith(
          {int? id,
          String? name,
          String? phoneNumber,
          String? address,
          String? preferences,
          Value<int?> isActive = const Value.absent()}) =>
      ClientsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        preferences: preferences ?? this.preferences,
        isActive: isActive.present ? isActive.value : this.isActive,
      );
  ClientsTableData copyWithCompanion(ClientsTableCompanion data) {
    return ClientsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      address: data.address.present ? data.address.value : this.address,
      preferences:
          data.preferences.present ? data.preferences.value : this.preferences,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('preferences: $preferences, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, phoneNumber, address, preferences, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.address == this.address &&
          other.preferences == this.preferences &&
          other.isActive == this.isActive);
}

class ClientsTableCompanion extends UpdateCompanion<ClientsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phoneNumber;
  final Value<String> address;
  final Value<String> preferences;
  final Value<int?> isActive;
  const ClientsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.preferences = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ClientsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phoneNumber,
    required String address,
    required String preferences,
    this.isActive = const Value.absent(),
  })  : name = Value(name),
        phoneNumber = Value(phoneNumber),
        address = Value(address),
        preferences = Value(preferences);
  static Insertable<ClientsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? address,
    Expression<String>? preferences,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (address != null) 'address': address,
      if (preferences != null) 'preferences': preferences,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ClientsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? phoneNumber,
      Value<String>? address,
      Value<String>? preferences,
      Value<int?>? isActive}) {
    return ClientsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      preferences: preferences ?? this.preferences,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (preferences.present) {
      map['preferences'] = Variable<String>(preferences.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('preferences: $preferences, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $ServiceTableTable extends ServiceTable
    with TableInfo<$ServiceTableTable, ServiceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _allDayValueMeta =
      const VerificationMeta('allDayValue');
  @override
  late final GeneratedColumn<double> allDayValue = GeneratedColumn<double>(
      'all_day_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _halfDayValueMeta =
      const VerificationMeta('halfDayValue');
  @override
  late final GeneratedColumn<double> halfDayValue = GeneratedColumn<double>(
      'half_day_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, allDayValue, halfDayValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_table';
  @override
  VerificationContext validateIntegrity(Insertable<ServiceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('all_day_value')) {
      context.handle(
          _allDayValueMeta,
          allDayValue.isAcceptableOrUnknown(
              data['all_day_value']!, _allDayValueMeta));
    } else if (isInserting) {
      context.missing(_allDayValueMeta);
    }
    if (data.containsKey('half_day_value')) {
      context.handle(
          _halfDayValueMeta,
          halfDayValue.isAcceptableOrUnknown(
              data['half_day_value']!, _halfDayValueMeta));
    } else if (isInserting) {
      context.missing(_halfDayValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      allDayValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}all_day_value'])!,
      halfDayValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}half_day_value'])!,
    );
  }

  @override
  $ServiceTableTable createAlias(String alias) {
    return $ServiceTableTable(attachedDatabase, alias);
  }
}

class ServiceTableData extends DataClass
    implements Insertable<ServiceTableData> {
  final int id;
  final String description;
  final double allDayValue;
  final double halfDayValue;
  const ServiceTableData(
      {required this.id,
      required this.description,
      required this.allDayValue,
      required this.halfDayValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['all_day_value'] = Variable<double>(allDayValue);
    map['half_day_value'] = Variable<double>(halfDayValue);
    return map;
  }

  ServiceTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceTableCompanion(
      id: Value(id),
      description: Value(description),
      allDayValue: Value(allDayValue),
      halfDayValue: Value(halfDayValue),
    );
  }

  factory ServiceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceTableData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      allDayValue: serializer.fromJson<double>(json['allDayValue']),
      halfDayValue: serializer.fromJson<double>(json['halfDayValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'allDayValue': serializer.toJson<double>(allDayValue),
      'halfDayValue': serializer.toJson<double>(halfDayValue),
    };
  }

  ServiceTableData copyWith(
          {int? id,
          String? description,
          double? allDayValue,
          double? halfDayValue}) =>
      ServiceTableData(
        id: id ?? this.id,
        description: description ?? this.description,
        allDayValue: allDayValue ?? this.allDayValue,
        halfDayValue: halfDayValue ?? this.halfDayValue,
      );
  ServiceTableData copyWithCompanion(ServiceTableCompanion data) {
    return ServiceTableData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      allDayValue:
          data.allDayValue.present ? data.allDayValue.value : this.allDayValue,
      halfDayValue: data.halfDayValue.present
          ? data.halfDayValue.value
          : this.halfDayValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceTableData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('allDayValue: $allDayValue, ')
          ..write('halfDayValue: $halfDayValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, allDayValue, halfDayValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceTableData &&
          other.id == this.id &&
          other.description == this.description &&
          other.allDayValue == this.allDayValue &&
          other.halfDayValue == this.halfDayValue);
}

class ServiceTableCompanion extends UpdateCompanion<ServiceTableData> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> allDayValue;
  final Value<double> halfDayValue;
  const ServiceTableCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.allDayValue = const Value.absent(),
    this.halfDayValue = const Value.absent(),
  });
  ServiceTableCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double allDayValue,
    required double halfDayValue,
  })  : description = Value(description),
        allDayValue = Value(allDayValue),
        halfDayValue = Value(halfDayValue);
  static Insertable<ServiceTableData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? allDayValue,
    Expression<double>? halfDayValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (allDayValue != null) 'all_day_value': allDayValue,
      if (halfDayValue != null) 'half_day_value': halfDayValue,
    });
  }

  ServiceTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<double>? allDayValue,
      Value<double>? halfDayValue}) {
    return ServiceTableCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      allDayValue: allDayValue ?? this.allDayValue,
      halfDayValue: halfDayValue ?? this.halfDayValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (allDayValue.present) {
      map['all_day_value'] = Variable<double>(allDayValue.value);
    }
    if (halfDayValue.present) {
      map['half_day_value'] = Variable<double>(halfDayValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceTableCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('allDayValue: $allDayValue, ')
          ..write('halfDayValue: $halfDayValue')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTableTable extends SchedulesTable
    with TableInfo<$SchedulesTableTable, SchedulesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES clients_table(id) ON DELETE CASCADE NOT NULL');
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, clientId, frequency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedules_table';
  @override
  VerificationContext validateIntegrity(Insertable<SchedulesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchedulesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchedulesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency']),
    );
  }

  @override
  $SchedulesTableTable createAlias(String alias) {
    return $SchedulesTableTable(attachedDatabase, alias);
  }
}

class SchedulesTableData extends DataClass
    implements Insertable<SchedulesTableData> {
  final int id;
  final int clientId;
  final int? frequency;
  const SchedulesTableData(
      {required this.id, required this.clientId, this.frequency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<int>(frequency);
    }
    return map;
  }

  SchedulesTableCompanion toCompanion(bool nullToAbsent) {
    return SchedulesTableCompanion(
      id: Value(id),
      clientId: Value(clientId),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
    );
  }

  factory SchedulesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchedulesTableData(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      frequency: serializer.fromJson<int?>(json['frequency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'frequency': serializer.toJson<int?>(frequency),
    };
  }

  SchedulesTableData copyWith(
          {int? id,
          int? clientId,
          Value<int?> frequency = const Value.absent()}) =>
      SchedulesTableData(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        frequency: frequency.present ? frequency.value : this.frequency,
      );
  SchedulesTableData copyWithCompanion(SchedulesTableCompanion data) {
    return SchedulesTableData(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesTableData(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('frequency: $frequency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, frequency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchedulesTableData &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.frequency == this.frequency);
}

class SchedulesTableCompanion extends UpdateCompanion<SchedulesTableData> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<int?> frequency;
  const SchedulesTableCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.frequency = const Value.absent(),
  });
  SchedulesTableCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    this.frequency = const Value.absent(),
  }) : clientId = Value(clientId);
  static Insertable<SchedulesTableData> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<int>? frequency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (frequency != null) 'frequency': frequency,
    });
  }

  SchedulesTableCompanion copyWith(
      {Value<int>? id, Value<int>? clientId, Value<int?>? frequency}) {
    return SchedulesTableCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      frequency: frequency ?? this.frequency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesTableCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('frequency: $frequency')
          ..write(')'))
        .toString();
  }
}

class $ServiceScheduledTableTable extends ServiceScheduledTable
    with TableInfo<$ServiceScheduledTableTable, ServiceScheduledTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceScheduledTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serviceIdMeta =
      const VerificationMeta('serviceId');
  @override
  late final GeneratedColumn<int> serviceId = GeneratedColumn<int>(
      'service_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES service_table(id) NOT NULL');
  static const VerificationMeta _scheduledIdMeta =
      const VerificationMeta('scheduledId');
  @override
  late final GeneratedColumn<int> scheduledId = GeneratedColumn<int>(
      'scheduled_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES schedules_table(id) ON DELETE CASCADE NOT NULL');
  static const VerificationMeta _serviceStatusMeta =
      const VerificationMeta('serviceStatus');
  @override
  late final GeneratedColumn<int> serviceStatus = GeneratedColumn<int>(
      'service_status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _extraValueMeta =
      const VerificationMeta('extraValue');
  @override
  late final GeneratedColumn<double> extraValue = GeneratedColumn<double>(
      'extra_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isHalfDayMeta =
      const VerificationMeta('isHalfDay');
  @override
  late final GeneratedColumn<int> isHalfDay = GeneratedColumn<int>(
      'is_half_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishDateMeta =
      const VerificationMeta('finishDate');
  @override
  late final GeneratedColumn<DateTime> finishDate = GeneratedColumn<DateTime>(
      'finish_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serviceId,
        scheduledId,
        serviceStatus,
        extraValue,
        isHalfDay,
        date,
        finishDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_scheduled_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ServiceScheduledTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('scheduled_id')) {
      context.handle(
          _scheduledIdMeta,
          scheduledId.isAcceptableOrUnknown(
              data['scheduled_id']!, _scheduledIdMeta));
    } else if (isInserting) {
      context.missing(_scheduledIdMeta);
    }
    if (data.containsKey('service_status')) {
      context.handle(
          _serviceStatusMeta,
          serviceStatus.isAcceptableOrUnknown(
              data['service_status']!, _serviceStatusMeta));
    } else if (isInserting) {
      context.missing(_serviceStatusMeta);
    }
    if (data.containsKey('extra_value')) {
      context.handle(
          _extraValueMeta,
          extraValue.isAcceptableOrUnknown(
              data['extra_value']!, _extraValueMeta));
    } else if (isInserting) {
      context.missing(_extraValueMeta);
    }
    if (data.containsKey('is_half_day')) {
      context.handle(
          _isHalfDayMeta,
          isHalfDay.isAcceptableOrUnknown(
              data['is_half_day']!, _isHalfDayMeta));
    } else if (isInserting) {
      context.missing(_isHalfDayMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date']!, _finishDateMeta));
    } else if (isInserting) {
      context.missing(_finishDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceScheduledTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceScheduledTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}service_id'])!,
      scheduledId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scheduled_id'])!,
      serviceStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}service_status'])!,
      extraValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}extra_value'])!,
      isHalfDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_half_day'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_date'])!,
    );
  }

  @override
  $ServiceScheduledTableTable createAlias(String alias) {
    return $ServiceScheduledTableTable(attachedDatabase, alias);
  }
}

class ServiceScheduledTableData extends DataClass
    implements Insertable<ServiceScheduledTableData> {
  final int id;
  final int serviceId;
  final int scheduledId;
  final int serviceStatus;
  final double extraValue;
  final int isHalfDay;
  final DateTime date;
  final DateTime finishDate;
  const ServiceScheduledTableData(
      {required this.id,
      required this.serviceId,
      required this.scheduledId,
      required this.serviceStatus,
      required this.extraValue,
      required this.isHalfDay,
      required this.date,
      required this.finishDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_id'] = Variable<int>(serviceId);
    map['scheduled_id'] = Variable<int>(scheduledId);
    map['service_status'] = Variable<int>(serviceStatus);
    map['extra_value'] = Variable<double>(extraValue);
    map['is_half_day'] = Variable<int>(isHalfDay);
    map['date'] = Variable<DateTime>(date);
    map['finish_date'] = Variable<DateTime>(finishDate);
    return map;
  }

  ServiceScheduledTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceScheduledTableCompanion(
      id: Value(id),
      serviceId: Value(serviceId),
      scheduledId: Value(scheduledId),
      serviceStatus: Value(serviceStatus),
      extraValue: Value(extraValue),
      isHalfDay: Value(isHalfDay),
      date: Value(date),
      finishDate: Value(finishDate),
    );
  }

  factory ServiceScheduledTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceScheduledTableData(
      id: serializer.fromJson<int>(json['id']),
      serviceId: serializer.fromJson<int>(json['serviceId']),
      scheduledId: serializer.fromJson<int>(json['scheduledId']),
      serviceStatus: serializer.fromJson<int>(json['serviceStatus']),
      extraValue: serializer.fromJson<double>(json['extraValue']),
      isHalfDay: serializer.fromJson<int>(json['isHalfDay']),
      date: serializer.fromJson<DateTime>(json['date']),
      finishDate: serializer.fromJson<DateTime>(json['finishDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceId': serializer.toJson<int>(serviceId),
      'scheduledId': serializer.toJson<int>(scheduledId),
      'serviceStatus': serializer.toJson<int>(serviceStatus),
      'extraValue': serializer.toJson<double>(extraValue),
      'isHalfDay': serializer.toJson<int>(isHalfDay),
      'date': serializer.toJson<DateTime>(date),
      'finishDate': serializer.toJson<DateTime>(finishDate),
    };
  }

  ServiceScheduledTableData copyWith(
          {int? id,
          int? serviceId,
          int? scheduledId,
          int? serviceStatus,
          double? extraValue,
          int? isHalfDay,
          DateTime? date,
          DateTime? finishDate}) =>
      ServiceScheduledTableData(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        scheduledId: scheduledId ?? this.scheduledId,
        serviceStatus: serviceStatus ?? this.serviceStatus,
        extraValue: extraValue ?? this.extraValue,
        isHalfDay: isHalfDay ?? this.isHalfDay,
        date: date ?? this.date,
        finishDate: finishDate ?? this.finishDate,
      );
  ServiceScheduledTableData copyWithCompanion(
      ServiceScheduledTableCompanion data) {
    return ServiceScheduledTableData(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      scheduledId:
          data.scheduledId.present ? data.scheduledId.value : this.scheduledId,
      serviceStatus: data.serviceStatus.present
          ? data.serviceStatus.value
          : this.serviceStatus,
      extraValue:
          data.extraValue.present ? data.extraValue.value : this.extraValue,
      isHalfDay: data.isHalfDay.present ? data.isHalfDay.value : this.isHalfDay,
      date: data.date.present ? data.date.value : this.date,
      finishDate:
          data.finishDate.present ? data.finishDate.value : this.finishDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceScheduledTableData(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('scheduledId: $scheduledId, ')
          ..write('serviceStatus: $serviceStatus, ')
          ..write('extraValue: $extraValue, ')
          ..write('isHalfDay: $isHalfDay, ')
          ..write('date: $date, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serviceId, scheduledId, serviceStatus,
      extraValue, isHalfDay, date, finishDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceScheduledTableData &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.scheduledId == this.scheduledId &&
          other.serviceStatus == this.serviceStatus &&
          other.extraValue == this.extraValue &&
          other.isHalfDay == this.isHalfDay &&
          other.date == this.date &&
          other.finishDate == this.finishDate);
}

class ServiceScheduledTableCompanion
    extends UpdateCompanion<ServiceScheduledTableData> {
  final Value<int> id;
  final Value<int> serviceId;
  final Value<int> scheduledId;
  final Value<int> serviceStatus;
  final Value<double> extraValue;
  final Value<int> isHalfDay;
  final Value<DateTime> date;
  final Value<DateTime> finishDate;
  const ServiceScheduledTableCompanion({
    this.id = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.scheduledId = const Value.absent(),
    this.serviceStatus = const Value.absent(),
    this.extraValue = const Value.absent(),
    this.isHalfDay = const Value.absent(),
    this.date = const Value.absent(),
    this.finishDate = const Value.absent(),
  });
  ServiceScheduledTableCompanion.insert({
    this.id = const Value.absent(),
    required int serviceId,
    required int scheduledId,
    required int serviceStatus,
    required double extraValue,
    required int isHalfDay,
    required DateTime date,
    required DateTime finishDate,
  })  : serviceId = Value(serviceId),
        scheduledId = Value(scheduledId),
        serviceStatus = Value(serviceStatus),
        extraValue = Value(extraValue),
        isHalfDay = Value(isHalfDay),
        date = Value(date),
        finishDate = Value(finishDate);
  static Insertable<ServiceScheduledTableData> custom({
    Expression<int>? id,
    Expression<int>? serviceId,
    Expression<int>? scheduledId,
    Expression<int>? serviceStatus,
    Expression<double>? extraValue,
    Expression<int>? isHalfDay,
    Expression<DateTime>? date,
    Expression<DateTime>? finishDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (scheduledId != null) 'scheduled_id': scheduledId,
      if (serviceStatus != null) 'service_status': serviceStatus,
      if (extraValue != null) 'extra_value': extraValue,
      if (isHalfDay != null) 'is_half_day': isHalfDay,
      if (date != null) 'date': date,
      if (finishDate != null) 'finish_date': finishDate,
    });
  }

  ServiceScheduledTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? serviceId,
      Value<int>? scheduledId,
      Value<int>? serviceStatus,
      Value<double>? extraValue,
      Value<int>? isHalfDay,
      Value<DateTime>? date,
      Value<DateTime>? finishDate}) {
    return ServiceScheduledTableCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      scheduledId: scheduledId ?? this.scheduledId,
      serviceStatus: serviceStatus ?? this.serviceStatus,
      extraValue: extraValue ?? this.extraValue,
      isHalfDay: isHalfDay ?? this.isHalfDay,
      date: date ?? this.date,
      finishDate: finishDate ?? this.finishDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<int>(serviceId.value);
    }
    if (scheduledId.present) {
      map['scheduled_id'] = Variable<int>(scheduledId.value);
    }
    if (serviceStatus.present) {
      map['service_status'] = Variable<int>(serviceStatus.value);
    }
    if (extraValue.present) {
      map['extra_value'] = Variable<double>(extraValue.value);
    }
    if (isHalfDay.present) {
      map['is_half_day'] = Variable<int>(isHalfDay.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<DateTime>(finishDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceScheduledTableCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('scheduledId: $scheduledId, ')
          ..write('serviceStatus: $serviceStatus, ')
          ..write('extraValue: $extraValue, ')
          ..write('isHalfDay: $isHalfDay, ')
          ..write('date: $date, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $ClientsTableTable clientsTable = $ClientsTableTable(this);
  late final $ServiceTableTable serviceTable = $ServiceTableTable(this);
  late final $SchedulesTableTable schedulesTable = $SchedulesTableTable(this);
  late final $ServiceScheduledTableTable serviceScheduledTable =
      $ServiceScheduledTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        clientsTable,
        serviceTable,
        schedulesTable,
        serviceScheduledTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('clients_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('schedules_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('schedules_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('service_scheduled_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  required String name,
  required String password,
  required String email,
  required DateTime notificationDateTime,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> password,
  Value<String> email,
  Value<DateTime> notificationDateTime,
});

class $$UserTableTableFilterComposer
    extends Composer<_$MyDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get notificationDateTime => $composableBuilder(
      column: $table.notificationDateTime,
      builder: (column) => ColumnFilters(column));
}

class $$UserTableTableOrderingComposer
    extends Composer<_$MyDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get notificationDateTime => $composableBuilder(
      column: $table.notificationDateTime,
      builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$MyDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get notificationDateTime => $composableBuilder(
      column: $table.notificationDateTime, builder: (column) => column);
}

class $$UserTableTableTableManager extends RootTableManager<
    _$MyDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserTableData,
      BaseReferences<_$MyDatabase, $UserTableTable, UserTableData>
    ),
    UserTableData,
    PrefetchHooks Function()> {
  $$UserTableTableTableManager(_$MyDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<DateTime> notificationDateTime = const Value.absent(),
          }) =>
              UserTableCompanion(
            id: id,
            name: name,
            password: password,
            email: email,
            notificationDateTime: notificationDateTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String password,
            required String email,
            required DateTime notificationDateTime,
          }) =>
              UserTableCompanion.insert(
            id: id,
            name: name,
            password: password,
            email: email,
            notificationDateTime: notificationDateTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserTableData,
      BaseReferences<_$MyDatabase, $UserTableTable, UserTableData>
    ),
    UserTableData,
    PrefetchHooks Function()>;
typedef $$ClientsTableTableCreateCompanionBuilder = ClientsTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String phoneNumber,
  required String address,
  required String preferences,
  Value<int?> isActive,
});
typedef $$ClientsTableTableUpdateCompanionBuilder = ClientsTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> phoneNumber,
  Value<String> address,
  Value<String> preferences,
  Value<int?> isActive,
});

final class $$ClientsTableTableReferences
    extends BaseReferences<_$MyDatabase, $ClientsTableTable, ClientsTableData> {
  $$ClientsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SchedulesTableTable, List<SchedulesTableData>>
      _schedulesTableRefsTable(_$MyDatabase db) =>
          MultiTypedResultKey.fromTable(db.schedulesTable,
              aliasName: $_aliasNameGenerator(
                  db.clientsTable.id, db.schedulesTable.clientId));

  $$SchedulesTableTableProcessedTableManager get schedulesTableRefs {
    final manager = $$SchedulesTableTableTableManager($_db, $_db.schedulesTable)
        .filter((f) => f.clientId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_schedulesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ClientsTableTableFilterComposer
    extends Composer<_$MyDatabase, $ClientsTableTable> {
  $$ClientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  Expression<bool> schedulesTableRefs(
      Expression<bool> Function($$SchedulesTableTableFilterComposer f) f) {
    final $$SchedulesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.clientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableFilterComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ClientsTableTableOrderingComposer
    extends Composer<_$MyDatabase, $ClientsTableTable> {
  $$ClientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$ClientsTableTableAnnotationComposer
    extends Composer<_$MyDatabase, $ClientsTableTable> {
  $$ClientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get preferences => $composableBuilder(
      column: $table.preferences, builder: (column) => column);

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> schedulesTableRefs<T extends Object>(
      Expression<T> Function($$SchedulesTableTableAnnotationComposer a) f) {
    final $$SchedulesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.clientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ClientsTableTableTableManager extends RootTableManager<
    _$MyDatabase,
    $ClientsTableTable,
    ClientsTableData,
    $$ClientsTableTableFilterComposer,
    $$ClientsTableTableOrderingComposer,
    $$ClientsTableTableAnnotationComposer,
    $$ClientsTableTableCreateCompanionBuilder,
    $$ClientsTableTableUpdateCompanionBuilder,
    (ClientsTableData, $$ClientsTableTableReferences),
    ClientsTableData,
    PrefetchHooks Function({bool schedulesTableRefs})> {
  $$ClientsTableTableTableManager(_$MyDatabase db, $ClientsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> preferences = const Value.absent(),
            Value<int?> isActive = const Value.absent(),
          }) =>
              ClientsTableCompanion(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            address: address,
            preferences: preferences,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String phoneNumber,
            required String address,
            required String preferences,
            Value<int?> isActive = const Value.absent(),
          }) =>
              ClientsTableCompanion.insert(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            address: address,
            preferences: preferences,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ClientsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({schedulesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (schedulesTableRefs) db.schedulesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (schedulesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ClientsTableTableReferences
                            ._schedulesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClientsTableTableReferences(db, table, p0)
                                .schedulesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.clientId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ClientsTableTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $ClientsTableTable,
    ClientsTableData,
    $$ClientsTableTableFilterComposer,
    $$ClientsTableTableOrderingComposer,
    $$ClientsTableTableAnnotationComposer,
    $$ClientsTableTableCreateCompanionBuilder,
    $$ClientsTableTableUpdateCompanionBuilder,
    (ClientsTableData, $$ClientsTableTableReferences),
    ClientsTableData,
    PrefetchHooks Function({bool schedulesTableRefs})>;
typedef $$ServiceTableTableCreateCompanionBuilder = ServiceTableCompanion
    Function({
  Value<int> id,
  required String description,
  required double allDayValue,
  required double halfDayValue,
});
typedef $$ServiceTableTableUpdateCompanionBuilder = ServiceTableCompanion
    Function({
  Value<int> id,
  Value<String> description,
  Value<double> allDayValue,
  Value<double> halfDayValue,
});

final class $$ServiceTableTableReferences
    extends BaseReferences<_$MyDatabase, $ServiceTableTable, ServiceTableData> {
  $$ServiceTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ServiceScheduledTableTable,
      List<ServiceScheduledTableData>> _serviceScheduledTableRefsTable(
          _$MyDatabase db) =>
      MultiTypedResultKey.fromTable(db.serviceScheduledTable,
          aliasName: $_aliasNameGenerator(
              db.serviceTable.id, db.serviceScheduledTable.serviceId));

  $$ServiceScheduledTableTableProcessedTableManager
      get serviceScheduledTableRefs {
    final manager = $$ServiceScheduledTableTableTableManager(
            $_db, $_db.serviceScheduledTable)
        .filter((f) => f.serviceId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_serviceScheduledTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ServiceTableTableFilterComposer
    extends Composer<_$MyDatabase, $ServiceTableTable> {
  $$ServiceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get allDayValue => $composableBuilder(
      column: $table.allDayValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get halfDayValue => $composableBuilder(
      column: $table.halfDayValue, builder: (column) => ColumnFilters(column));

  Expression<bool> serviceScheduledTableRefs(
      Expression<bool> Function($$ServiceScheduledTableTableFilterComposer f)
          f) {
    final $$ServiceScheduledTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.serviceScheduledTable,
            getReferencedColumn: (t) => t.serviceId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ServiceScheduledTableTableFilterComposer(
                  $db: $db,
                  $table: $db.serviceScheduledTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ServiceTableTableOrderingComposer
    extends Composer<_$MyDatabase, $ServiceTableTable> {
  $$ServiceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get allDayValue => $composableBuilder(
      column: $table.allDayValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get halfDayValue => $composableBuilder(
      column: $table.halfDayValue,
      builder: (column) => ColumnOrderings(column));
}

class $$ServiceTableTableAnnotationComposer
    extends Composer<_$MyDatabase, $ServiceTableTable> {
  $$ServiceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get allDayValue => $composableBuilder(
      column: $table.allDayValue, builder: (column) => column);

  GeneratedColumn<double> get halfDayValue => $composableBuilder(
      column: $table.halfDayValue, builder: (column) => column);

  Expression<T> serviceScheduledTableRefs<T extends Object>(
      Expression<T> Function($$ServiceScheduledTableTableAnnotationComposer a)
          f) {
    final $$ServiceScheduledTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.serviceScheduledTable,
            getReferencedColumn: (t) => t.serviceId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ServiceScheduledTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.serviceScheduledTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ServiceTableTableTableManager extends RootTableManager<
    _$MyDatabase,
    $ServiceTableTable,
    ServiceTableData,
    $$ServiceTableTableFilterComposer,
    $$ServiceTableTableOrderingComposer,
    $$ServiceTableTableAnnotationComposer,
    $$ServiceTableTableCreateCompanionBuilder,
    $$ServiceTableTableUpdateCompanionBuilder,
    (ServiceTableData, $$ServiceTableTableReferences),
    ServiceTableData,
    PrefetchHooks Function({bool serviceScheduledTableRefs})> {
  $$ServiceTableTableTableManager(_$MyDatabase db, $ServiceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> allDayValue = const Value.absent(),
            Value<double> halfDayValue = const Value.absent(),
          }) =>
              ServiceTableCompanion(
            id: id,
            description: description,
            allDayValue: allDayValue,
            halfDayValue: halfDayValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            required double allDayValue,
            required double halfDayValue,
          }) =>
              ServiceTableCompanion.insert(
            id: id,
            description: description,
            allDayValue: allDayValue,
            halfDayValue: halfDayValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ServiceTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({serviceScheduledTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceScheduledTableRefs) db.serviceScheduledTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (serviceScheduledTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ServiceTableTableReferences
                            ._serviceScheduledTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ServiceTableTableReferences(db, table, p0)
                                .serviceScheduledTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.serviceId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ServiceTableTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $ServiceTableTable,
    ServiceTableData,
    $$ServiceTableTableFilterComposer,
    $$ServiceTableTableOrderingComposer,
    $$ServiceTableTableAnnotationComposer,
    $$ServiceTableTableCreateCompanionBuilder,
    $$ServiceTableTableUpdateCompanionBuilder,
    (ServiceTableData, $$ServiceTableTableReferences),
    ServiceTableData,
    PrefetchHooks Function({bool serviceScheduledTableRefs})>;
typedef $$SchedulesTableTableCreateCompanionBuilder = SchedulesTableCompanion
    Function({
  Value<int> id,
  required int clientId,
  Value<int?> frequency,
});
typedef $$SchedulesTableTableUpdateCompanionBuilder = SchedulesTableCompanion
    Function({
  Value<int> id,
  Value<int> clientId,
  Value<int?> frequency,
});

final class $$SchedulesTableTableReferences extends BaseReferences<_$MyDatabase,
    $SchedulesTableTable, SchedulesTableData> {
  $$SchedulesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTableTable _clientIdTable(_$MyDatabase db) =>
      db.clientsTable.createAlias(
          $_aliasNameGenerator(db.schedulesTable.clientId, db.clientsTable.id));

  $$ClientsTableTableProcessedTableManager? get clientId {
    if ($_item.clientId == null) return null;
    final manager = $$ClientsTableTableTableManager($_db, $_db.clientsTable)
        .filter((f) => f.id($_item.clientId!));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ServiceScheduledTableTable,
      List<ServiceScheduledTableData>> _serviceScheduledTableRefsTable(
          _$MyDatabase db) =>
      MultiTypedResultKey.fromTable(db.serviceScheduledTable,
          aliasName: $_aliasNameGenerator(
              db.schedulesTable.id, db.serviceScheduledTable.scheduledId));

  $$ServiceScheduledTableTableProcessedTableManager
      get serviceScheduledTableRefs {
    final manager = $$ServiceScheduledTableTableTableManager(
            $_db, $_db.serviceScheduledTable)
        .filter((f) => f.scheduledId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_serviceScheduledTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SchedulesTableTableFilterComposer
    extends Composer<_$MyDatabase, $SchedulesTableTable> {
  $$SchedulesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnFilters(column));

  $$ClientsTableTableFilterComposer get clientId {
    final $$ClientsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clientsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableTableFilterComposer(
              $db: $db,
              $table: $db.clientsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> serviceScheduledTableRefs(
      Expression<bool> Function($$ServiceScheduledTableTableFilterComposer f)
          f) {
    final $$ServiceScheduledTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.serviceScheduledTable,
            getReferencedColumn: (t) => t.scheduledId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ServiceScheduledTableTableFilterComposer(
                  $db: $db,
                  $table: $db.serviceScheduledTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$SchedulesTableTableOrderingComposer
    extends Composer<_$MyDatabase, $SchedulesTableTable> {
  $$SchedulesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  $$ClientsTableTableOrderingComposer get clientId {
    final $$ClientsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clientsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableTableOrderingComposer(
              $db: $db,
              $table: $db.clientsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SchedulesTableTableAnnotationComposer
    extends Composer<_$MyDatabase, $SchedulesTableTable> {
  $$SchedulesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  $$ClientsTableTableAnnotationComposer get clientId {
    final $$ClientsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clientsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.clientsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> serviceScheduledTableRefs<T extends Object>(
      Expression<T> Function($$ServiceScheduledTableTableAnnotationComposer a)
          f) {
    final $$ServiceScheduledTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.serviceScheduledTable,
            getReferencedColumn: (t) => t.scheduledId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ServiceScheduledTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.serviceScheduledTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$SchedulesTableTableTableManager extends RootTableManager<
    _$MyDatabase,
    $SchedulesTableTable,
    SchedulesTableData,
    $$SchedulesTableTableFilterComposer,
    $$SchedulesTableTableOrderingComposer,
    $$SchedulesTableTableAnnotationComposer,
    $$SchedulesTableTableCreateCompanionBuilder,
    $$SchedulesTableTableUpdateCompanionBuilder,
    (SchedulesTableData, $$SchedulesTableTableReferences),
    SchedulesTableData,
    PrefetchHooks Function({bool clientId, bool serviceScheduledTableRefs})> {
  $$SchedulesTableTableTableManager(_$MyDatabase db, $SchedulesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchedulesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchedulesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchedulesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> clientId = const Value.absent(),
            Value<int?> frequency = const Value.absent(),
          }) =>
              SchedulesTableCompanion(
            id: id,
            clientId: clientId,
            frequency: frequency,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int clientId,
            Value<int?> frequency = const Value.absent(),
          }) =>
              SchedulesTableCompanion.insert(
            id: id,
            clientId: clientId,
            frequency: frequency,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SchedulesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {clientId = false, serviceScheduledTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (serviceScheduledTableRefs) db.serviceScheduledTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (clientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.clientId,
                    referencedTable:
                        $$SchedulesTableTableReferences._clientIdTable(db),
                    referencedColumn:
                        $$SchedulesTableTableReferences._clientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (serviceScheduledTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SchedulesTableTableReferences
                            ._serviceScheduledTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SchedulesTableTableReferences(db, table, p0)
                                .serviceScheduledTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.scheduledId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SchedulesTableTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $SchedulesTableTable,
    SchedulesTableData,
    $$SchedulesTableTableFilterComposer,
    $$SchedulesTableTableOrderingComposer,
    $$SchedulesTableTableAnnotationComposer,
    $$SchedulesTableTableCreateCompanionBuilder,
    $$SchedulesTableTableUpdateCompanionBuilder,
    (SchedulesTableData, $$SchedulesTableTableReferences),
    SchedulesTableData,
    PrefetchHooks Function({bool clientId, bool serviceScheduledTableRefs})>;
typedef $$ServiceScheduledTableTableCreateCompanionBuilder
    = ServiceScheduledTableCompanion Function({
  Value<int> id,
  required int serviceId,
  required int scheduledId,
  required int serviceStatus,
  required double extraValue,
  required int isHalfDay,
  required DateTime date,
  required DateTime finishDate,
});
typedef $$ServiceScheduledTableTableUpdateCompanionBuilder
    = ServiceScheduledTableCompanion Function({
  Value<int> id,
  Value<int> serviceId,
  Value<int> scheduledId,
  Value<int> serviceStatus,
  Value<double> extraValue,
  Value<int> isHalfDay,
  Value<DateTime> date,
  Value<DateTime> finishDate,
});

final class $$ServiceScheduledTableTableReferences extends BaseReferences<
    _$MyDatabase, $ServiceScheduledTableTable, ServiceScheduledTableData> {
  $$ServiceScheduledTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ServiceTableTable _serviceIdTable(_$MyDatabase db) =>
      db.serviceTable.createAlias($_aliasNameGenerator(
          db.serviceScheduledTable.serviceId, db.serviceTable.id));

  $$ServiceTableTableProcessedTableManager? get serviceId {
    if ($_item.serviceId == null) return null;
    final manager = $$ServiceTableTableTableManager($_db, $_db.serviceTable)
        .filter((f) => f.id($_item.serviceId!));
    final item = $_typedResult.readTableOrNull(_serviceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SchedulesTableTable _scheduledIdTable(_$MyDatabase db) =>
      db.schedulesTable.createAlias($_aliasNameGenerator(
          db.serviceScheduledTable.scheduledId, db.schedulesTable.id));

  $$SchedulesTableTableProcessedTableManager? get scheduledId {
    if ($_item.scheduledId == null) return null;
    final manager = $$SchedulesTableTableTableManager($_db, $_db.schedulesTable)
        .filter((f) => f.id($_item.scheduledId!));
    final item = $_typedResult.readTableOrNull(_scheduledIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ServiceScheduledTableTableFilterComposer
    extends Composer<_$MyDatabase, $ServiceScheduledTableTable> {
  $$ServiceScheduledTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serviceStatus => $composableBuilder(
      column: $table.serviceStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get extraValue => $composableBuilder(
      column: $table.extraValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isHalfDay => $composableBuilder(
      column: $table.isHalfDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnFilters(column));

  $$ServiceTableTableFilterComposer get serviceId {
    final $$ServiceTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.serviceId,
        referencedTable: $db.serviceTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceTableTableFilterComposer(
              $db: $db,
              $table: $db.serviceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SchedulesTableTableFilterComposer get scheduledId {
    final $$SchedulesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scheduledId,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableFilterComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ServiceScheduledTableTableOrderingComposer
    extends Composer<_$MyDatabase, $ServiceScheduledTableTable> {
  $$ServiceScheduledTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serviceStatus => $composableBuilder(
      column: $table.serviceStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get extraValue => $composableBuilder(
      column: $table.extraValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isHalfDay => $composableBuilder(
      column: $table.isHalfDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnOrderings(column));

  $$ServiceTableTableOrderingComposer get serviceId {
    final $$ServiceTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.serviceId,
        referencedTable: $db.serviceTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceTableTableOrderingComposer(
              $db: $db,
              $table: $db.serviceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SchedulesTableTableOrderingComposer get scheduledId {
    final $$SchedulesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scheduledId,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableOrderingComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ServiceScheduledTableTableAnnotationComposer
    extends Composer<_$MyDatabase, $ServiceScheduledTableTable> {
  $$ServiceScheduledTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serviceStatus => $composableBuilder(
      column: $table.serviceStatus, builder: (column) => column);

  GeneratedColumn<double> get extraValue => $composableBuilder(
      column: $table.extraValue, builder: (column) => column);

  GeneratedColumn<int> get isHalfDay =>
      $composableBuilder(column: $table.isHalfDay, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => column);

  $$ServiceTableTableAnnotationComposer get serviceId {
    final $$ServiceTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.serviceId,
        referencedTable: $db.serviceTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ServiceTableTableAnnotationComposer(
              $db: $db,
              $table: $db.serviceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SchedulesTableTableAnnotationComposer get scheduledId {
    final $$SchedulesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scheduledId,
        referencedTable: $db.schedulesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SchedulesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.schedulesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ServiceScheduledTableTableTableManager extends RootTableManager<
    _$MyDatabase,
    $ServiceScheduledTableTable,
    ServiceScheduledTableData,
    $$ServiceScheduledTableTableFilterComposer,
    $$ServiceScheduledTableTableOrderingComposer,
    $$ServiceScheduledTableTableAnnotationComposer,
    $$ServiceScheduledTableTableCreateCompanionBuilder,
    $$ServiceScheduledTableTableUpdateCompanionBuilder,
    (ServiceScheduledTableData, $$ServiceScheduledTableTableReferences),
    ServiceScheduledTableData,
    PrefetchHooks Function({bool serviceId, bool scheduledId})> {
  $$ServiceScheduledTableTableTableManager(
      _$MyDatabase db, $ServiceScheduledTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceScheduledTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceScheduledTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceScheduledTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> serviceId = const Value.absent(),
            Value<int> scheduledId = const Value.absent(),
            Value<int> serviceStatus = const Value.absent(),
            Value<double> extraValue = const Value.absent(),
            Value<int> isHalfDay = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> finishDate = const Value.absent(),
          }) =>
              ServiceScheduledTableCompanion(
            id: id,
            serviceId: serviceId,
            scheduledId: scheduledId,
            serviceStatus: serviceStatus,
            extraValue: extraValue,
            isHalfDay: isHalfDay,
            date: date,
            finishDate: finishDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int serviceId,
            required int scheduledId,
            required int serviceStatus,
            required double extraValue,
            required int isHalfDay,
            required DateTime date,
            required DateTime finishDate,
          }) =>
              ServiceScheduledTableCompanion.insert(
            id: id,
            serviceId: serviceId,
            scheduledId: scheduledId,
            serviceStatus: serviceStatus,
            extraValue: extraValue,
            isHalfDay: isHalfDay,
            date: date,
            finishDate: finishDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ServiceScheduledTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({serviceId = false, scheduledId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (serviceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.serviceId,
                    referencedTable: $$ServiceScheduledTableTableReferences
                        ._serviceIdTable(db),
                    referencedColumn: $$ServiceScheduledTableTableReferences
                        ._serviceIdTable(db)
                        .id,
                  ) as T;
                }
                if (scheduledId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.scheduledId,
                    referencedTable: $$ServiceScheduledTableTableReferences
                        ._scheduledIdTable(db),
                    referencedColumn: $$ServiceScheduledTableTableReferences
                        ._scheduledIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ServiceScheduledTableTableProcessedTableManager
    = ProcessedTableManager<
        _$MyDatabase,
        $ServiceScheduledTableTable,
        ServiceScheduledTableData,
        $$ServiceScheduledTableTableFilterComposer,
        $$ServiceScheduledTableTableOrderingComposer,
        $$ServiceScheduledTableTableAnnotationComposer,
        $$ServiceScheduledTableTableCreateCompanionBuilder,
        $$ServiceScheduledTableTableUpdateCompanionBuilder,
        (ServiceScheduledTableData, $$ServiceScheduledTableTableReferences),
        ServiceScheduledTableData,
        PrefetchHooks Function({bool serviceId, bool scheduledId})>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$ClientsTableTableTableManager get clientsTable =>
      $$ClientsTableTableTableManager(_db, _db.clientsTable);
  $$ServiceTableTableTableManager get serviceTable =>
      $$ServiceTableTableTableManager(_db, _db.serviceTable);
  $$SchedulesTableTableTableManager get schedulesTable =>
      $$SchedulesTableTableTableManager(_db, _db.schedulesTable);
  $$ServiceScheduledTableTableTableManager get serviceScheduledTable =>
      $$ServiceScheduledTableTableTableManager(_db, _db.serviceScheduledTable);
}
