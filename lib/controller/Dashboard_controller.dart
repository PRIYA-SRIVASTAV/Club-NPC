import 'package:club_npc_registration/core/ApiCall.dart';
import '../constants/prefs_contants.dart';
import '../utils/helper_Methods.dart';

class Dashboard_controller {
  Dashboard_controller_method() async {
    var ID;
    await getPref().then((value) {
      ID = value.getString(KEYID);
    });
    var a = await ApiCalling().getDetailsOfCurrentUser(ID);
    return a;
  }
}
