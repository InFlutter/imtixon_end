
class Harajat{
  final int id;
  String decctiroein;
  double priec;
  DateTime date;

  Harajat({
    required this.id,
    required this.decctiroein,
    required this.priec,
    required this.date,
  });

  factory Harajat.fromMap(Map<String, dynamic> map) {
    return Harajat(
      id: map['id'] as int,
      decctiroein: map['title'].toString(),
      priec: map['amount'] as double,
      date: DateTime.parse(
        map['date'],
      ),
    );
  }
}
