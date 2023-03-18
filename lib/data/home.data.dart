import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/models/home_card.model.dart';

final homeData = [
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/medico.png",
    link: Routes.medico.path,
  ),
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/farmacia.png",
    link: Routes.farmacia.path,
  ),
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/accompagnatore.png",
    link: Routes.accompagnatore.path,
  ),
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/prima.necessita.png",
    link: Routes.necessita.path,
  ),
];
