import 'package:inovola_demo/Repo/reverse_details_Mock.dart';
import 'package:inovola_demo/models/reverse_details.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ReserveDetailsRepository get reserveDetailsRepository {
    switch (_flavor) {
     
      default:
        return  MockReserveDetailsRepository();
    }
  }
}