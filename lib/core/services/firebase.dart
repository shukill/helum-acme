import '../constants/firebase_constants.dart';
import '../../views/home/models/tracking_categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../views/detailView/tracking_data_model.dart';

class MyFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<TrackingCategoriesModel>> trackingCategoryStream() {
    return _firestore
        .collection(FirebaseConstants.track)
        .orderBy('order')
        .withConverter<TrackingCategoriesModel>(
          fromFirestore: (snapshot, _) =>
              TrackingCategoriesModel.fromMap(snapshot.data()!),
          toFirestore: (event, _) => event.toMap(),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<TarckingDataModel>> trackingDataStream(String id) {
    return _firestore
        .collection(FirebaseConstants.track)
        .doc(id)
        .collection(FirebaseConstants.data)
        .orderBy('uploadedTime', descending: true)
        .withConverter<TarckingDataModel>(
          fromFirestore: (snapshot, _) =>
              TarckingDataModel.fromMap(snapshot.data()!),
          toFirestore: (event, _) => event.toMap(),
        )
        .snapshots();
  }

  Future<QuerySnapshot<TrackingCategoriesModel>> getTrackingCategory() async {
    return await _firestore
        .collection(FirebaseConstants.track)
        .orderBy('order')
        .withConverter<TrackingCategoriesModel>(
          fromFirestore: (snapshot, _) =>
              TrackingCategoriesModel.fromMap(snapshot.data()!),
          toFirestore: (event, _) => event.toMap(),
        )
        .get();
  }

  Future<bool?> addTrackingData({
    required String catId,
    required String dataId,
    required Map<String, String> value,
  }) async {
    var upload = await _firestore
        .collection(FirebaseConstants.track)
        .doc(catId)
        .collection(FirebaseConstants.data)
        .doc(dataId)
        .set(value)
        .then(
          (value) => Fluttertoast.showToast(msg: 'Data Captured!'),
        )
        .catchError(
          (error) => Fluttertoast.showToast(msg: 'Something went wrong'),
        );
    return upload;
  }
}
