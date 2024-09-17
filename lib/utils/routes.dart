import 'package:imtixon_end/views/screens/home_screen2.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/harajatlarni_funskisyasi.dart';


class AppRoute {
  static final routes = {
    RouteNames.home: (ctx) => const HomeScreen(),
    RouteNames.harajatlar: (ctx) => const HarajatlarScreen(),
    RouteNames.daromad: (ctx) => const HomeScreen2(),
  };
}

class RouteNames {
  static const String home = "/";
  static const String harajatlar = "/manage-expense";
  static const String daromad = "/daromad";
}
