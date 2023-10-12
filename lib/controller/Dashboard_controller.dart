import 'package:club_npc_registration/core/ApiCall.dart';

class Dashboard_controller {
  Dashboard_controller_method() async {
    var a = await ApiCalling().getDetailsOfCurrentUser();
    return a;
  }
}
