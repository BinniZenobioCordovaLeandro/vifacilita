import 'package:vifacilita/models/app_route_model.dart';

final routeData = {
  Routes.doctor.path: AppRouteModel(
    path: Routes.doctor.path,
    title: "doctor_title",
    button: "doctor_button",
    collection: "doctor_collection",
  ),
  Routes.pharmacy.path: AppRouteModel(
    path: Routes.pharmacy.path,
    title: "pharmacy_title",
    button: "pharmacy_button",
    collection: "pharmacy_collection",
  ),
  Routes.accompanist.path: AppRouteModel(
    path: Routes.accompanist.path,
    title: "accompanist_title",
    button: "accompanist_button",
    collection: "accompanist_collection",
  ),
  Routes.market.path: AppRouteModel(
    path: Routes.market.path,
    title: "market_title",
    button: "market_button",
    collection: "market_collection",
  ),
};

enum Routes {
  doctor,
  pharmacy,
  accompanist,
  market,
}

extension RoutesExtension on Routes {
  String? get path {
    switch (this) {
      case Routes.doctor:
        return 'doctor';
      case Routes.pharmacy:
        return 'pharmacy';
      case Routes.accompanist:
        return 'accompanist';
      case Routes.market:
        return 'necessita';
      default:
        return null;
    }
  }
}
