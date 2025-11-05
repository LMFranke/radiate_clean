class Service {

  int id;
  double allDayValue;
  double halfDayValue;
  double description;

  Service(this.id, this.allDayValue, this.halfDayValue, this.description);

  @override
  String toString() {
    return 'Service{id: $id, allDayValue: $allDayValue, halfDayValue: $halfDayValue, description: $description}';
  }

}