import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../constants.dart' as constants;
//import 'package:chrome/chrome_app.dart' as chrome;

@Component(
  selector: 'setup',
  directives: [
    routerDirectives,
  ],
  templateUrl: 'setup.html',
)
class SetupComponent implements OnActivate {
  String enterPlayPlanIdMessage = '';
  String exapmleMessage = '';

  @override
  void onActivate(_, RouterState current) async {
    getMediaPlayPlanId(current.parameters);
  }

  getMediaPlayPlanId (Map<String, String> parameters) {
    final id = parameters['id'];
    if(id != null) {
      setMediaPlayPlanIdInLocalStorage(id);
      enterPlayPlanIdMessage = 'Setup complete, Please visit the homepage';
    } else {
      enterPlayPlanIdMessage =
          'Please enter the Media play plan id as a route param.';
      exapmleMessage =
          'E.g. http://storeads-staging.firebaseapp.com/#/setup/123';
    }
  }

  setMediaPlayPlanIdInLocalStorage(id) {
    window.localStorage[constants.DEVICE_ID_LOCAL_STORAGE_KEY] = id;
  }
}