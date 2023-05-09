import 'package:vifacilita/data/route.data.dart';
import 'package:vifacilita/models/home_card.model.dart';

final homeData = [
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/medico.png",
    link: Routes.doctor.path,
    title: 'title_medic',
  ),
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/farmacia.png",
    link: Routes.pharmacy.path,
    title: 'title_farmacia',
  ),
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/accompagnatore.png",
    link: Routes.accompanist.path,
    title: 'title_accompanist',
  ),
  HomeCardModel(
    color: "#FFFFFF",
    icon: "assets/images/prima.necessita.png",
    link: Routes.market.path,
    title: 'title_market',
  ),
];
