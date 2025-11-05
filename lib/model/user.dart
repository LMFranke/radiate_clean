class User {
  int id;
  String name;
  String email;
  DateTime notificationDateTime;

  User(
    this.id,
    this.name,
    this.email,
    this.notificationDateTime,
  );

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, notificationDateTime: $notificationDateTime}';
  }

}
