class Daromad{
  final int id;
  String decctiroein;
  double priec;
  DateTime date;

  Daromad({
    required this.id,
    required this.decctiroein,
    required this.priec,
    required this.date,
  });

  factory Daromad.fromMap(Map<String, dynamic> map) {
    return Daromad(
      id: map['id'] as int,
      decctiroein: map['title'].toString(),
      priec: map['amount'] as double,
      date: DateTime.parse(
        map['date'],
      ),
    );
  }
}
