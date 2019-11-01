import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import '../../services/display_ads_service.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import '../../../constants.dart' as constants;


@Component(
  selector: 'display-ads',
  styleUrls: ['display_ads.css'],
  templateUrl: 'display_ads.html',
  directives: [coreDirectives, MaterialIconComponent]
)
class DisplayAdsComponent implements OnInit {
  String imageToDisplay = '';
  var activePlans = [];
  final DisplayAdsService _displayAdsService;
  final Router _router;
  int slideIndex = 0;
  int haltDuration = 6;
  bool imageNotFound = false;
  DisplayAdsComponent(this._displayAdsService, this._router);

  ngOnInit() {
    this.getDeviceId();
  }

  getDeviceIdFromLocalStorage() {
    return window.localStorage[constants.DEVICE_ID_LOCAL_STORAGE_KEY];
  }

  getDeviceId() {
    String device_id = getDeviceIdFromLocalStorage();
    if(device_id == null) {
      // ONLY FOR DEMO: Media play plan id not found on device.
      // Redirect to setup.
//      this._router.navigate('/setup');
      this.imageNotFound = true;

    } else {
      try {
        if (device_id == '9ZkcJWQ2DCFLpobrfenR') {
          this._displayAdsService.getDataFromFireStore(device_id).then(
              this.onFirebaseQuerySuccess);
        } else {
          this.imageNotFound = true;
        }
      } catch(e) {
        this.onFirebaseQueryError(e);
      }
    }
  }

  /**
   * Checks whether a media play plan id is found. If found show the image on
   * displayAds view, else display default image.
   */
  onFirebaseQuerySuccess (querySnapshot) {
    if (querySnapshot.data() != null) {
      this.getActivePlans(querySnapshot.data());
      this.imageNotFound = false;
      this.rotateImages();
    } else {
      this.imageToDisplay = constants.DEFAULT_URL;
    }
  }

  getActivePlans(plan) {
    if (plan['status'] == 'ENABLED') {
      if (this.checkPlanValidity(plan)) {
        this.activePlans.add(plan);
      }
    }
  }

  checkPlanValidity(plan) {
    var startDateTime = plan['start_time'];
    var timeAfterMediaPlayed = startDateTime.add(Duration(seconds: plan['play_duration']));
    var endDateTime = plan['end_time'];
    if (this.isStartAndEndTimesValid(startDateTime, endDateTime)) {
      if (timeAfterMediaPlayed.isBefore(endDateTime)) {
        return true;
      }
      return false;
    }
    return false;
  }

  rotateImages() {
    if(this.slideIndex < this.activePlans[0]['media'].length){
      this.haltDuration = this.activePlans[0]['play_duration'];
      this.imageToDisplay = this.activePlans[0]['media'][this.slideIndex]['media_url'];
      Timer(Duration(seconds: this.haltDuration) , rotateImages);
      this.slideIndex++;
    }
    else{
      this.slideIndex=0;
      Timer(Duration(seconds: this.haltDuration) , rotateImages);
    }
  }

  isStartAndEndTimesValid(start, end) {
    var now = DateTime.now();
    if (start.isAfter(now)) {
      return false;
    }
    if (end.isBefore(now)) {
      return false;
    }
    return true;
  }

  /** Shows default image on store view. */
  onFirebaseQueryError(error) {
    imageToDisplay = constants.DEFAULT_URL;
  }
}

