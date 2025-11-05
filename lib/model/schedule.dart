class Schedule {
  int id;
  int clientId;
  int frequency;

  Schedule(
    this.id,
    this.clientId,
    this.frequency,
  );

  @override
  String toString() {
    return 'Schedule{id: $id, clientId: $clientId, frequency: $frequency}';
  }

}
