import 'package:vifacilita/models/app_route_model.dart';

final routeData = {
  Routes.medico.path: AppRouteModel(
    path: Routes.medico.path,
    title: "medic",
    button: "add_medic",
    collection: "medic_collection",
  ),
  Routes.farmacia.path: AppRouteModel(
    path: Routes.farmacia.path,
    title: "farmacia",
    button: "add_farmacia",
    collection: "farmacia_collection",
  ),
  Routes.accompagnatore.path: AppRouteModel(
    path: Routes.accompagnatore.path,
    title: "partner",
    button: "add_partner",
    collection: "partner_collection",
  ),
  Routes.necessita.path: AppRouteModel(
    path: Routes.necessita.path,
    title: "prima_necessita",
    button: "add_necessita",
    collection: "necessita_collection",
  ),
};

enum Routes {
  medico,
  farmacia,
  accompagnatore,
  necessita,
}

extension RoutesExtension on Routes {
  String? get path {
    switch (this) {
      case Routes.medico:
        return 'medico';
      case Routes.farmacia:
        return 'farmacia';
      case Routes.accompagnatore:
        return 'accompagnatore';
      case Routes.necessita:
        return 'necessita';
      default:
        return null;
    }
  }
}
