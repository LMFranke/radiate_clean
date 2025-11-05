class Client {
  int id;
  String name;
  String address;
  String phoneNumber;
  String preferences;

  Client(
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.preferences,
  );

  @override
  String toString() {
    return 'Client{id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, preferences: $preferences}';
  }

}
