import 'package:firebase/firebase.dart' as firebase;
import 'package:firebase/firestore.dart' as fireStore;

class DisplayAdsService {
  fireStore.Firestore store = null;

  DisplayAdsService() {
    firebase.initializeApp(
        apiKey: "API KEY HERE",
        authDomain: "store-ads-staging.firebaseapp.com",
        databaseURL: "https://store-ads-staging.firebaseio.com",
        storageBucket: "staging.store-ads-staging.appspot.com",
        projectId: 'store-ads-staging');

    store = firebase.firestore();

  }

  getDataFromFireStore(String display_device_id) {
    var docRef = store.collection('publishers').doc('woolworths')
        .collection('stores').doc('woolworths_metro_york_street')
        .collection('devices').doc('device_111_self_checkout')
        .collection('media_play_plans').doc('coke_branding_2019');

    return docRef.get();
  }
}
