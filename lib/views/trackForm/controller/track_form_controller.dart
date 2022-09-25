import 'package:acme/core/services/firebase.dart';
import 'package:acme/views/home/models/tracking_categories_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class TackFormController extends GetxController {
  RxBool isFectingData = false.obs;
  RxBool isUploadingData = false.obs;
  RxBool errorFecthingData = false.obs;
  RxList<TrackingCategoriesModel> categoryList =
      <TrackingCategoriesModel>[].obs;

  RxList<Map<String, dynamic>> answerList = <Map<String, dynamic>>[].obs;

  void getCategries() async {
    try {
      isFectingData(true);
      errorFecthingData(false);
      categoryList.clear();
      var data = await MyFirebaseServices().getTrackingCategory();
      for (int i = 0; i < data.docs.length; i++) {
        TrackingCategoriesModel cat = data.docs[i].data();

        categoryList.add(cat);
      }
    } catch (e) {
      errorFecthingData(true);
      rethrow;
    } finally {
      isFectingData(false);
    }
  }

  void updateAnswer({
    required String id,
    required String value,
  }) {
    var content = {
      'id': id,
      'value': value,
    };
    if (answerList.isNotEmpty) {
      var isAlreadyPresnt = answerList.firstWhereOrNull(
        (element) => element['id'] == content['id'],
      );

      if (isAlreadyPresnt != null) {
        int index = answerList.indexWhere(
          (element) => element['id'] == content['id'],
        );
        if (value.trim().isEmpty) {
          answerList.removeAt(index);
        } else {
          answerList[index] = content;
        }
      } else {
        if (value.trim().isNotEmpty) {
          answerList.add(content);
        }
      }
    } else {
      if (value.trim().isNotEmpty) {
        answerList.add(content);
      }
    }
  }

  void submitAnswer() async {
    try {
      isUploadingData(true);
      for (int i = 0; i < answerList.length; i++) {
        String valueId = const Uuid().v4();
        var value = answerList[i];
        Map<String, String> answer = {
          'id': valueId,
          'value': value['value'],
          'uploadedTime': DateTime.now().toIso8601String(),
          'updatedTime': DateTime.now().toIso8601String(),
        };

        await MyFirebaseServices().addTrackingData(
          catId: value['id'],
          dataId: valueId,
          value: answer,
        );
      }
    } catch (e) {
      rethrow;
    } finally {
      isUploadingData(false);
    }
  }
}
