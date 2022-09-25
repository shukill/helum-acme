import 'package:acme/core/styles/app_text_styles.dart';
import 'package:acme/core/widgets/common_empty_error.dart';
import 'package:acme/core/widgets/common_loading_indicator.dart';

import 'package:acme/core/widgets/something_went_wrong.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/styles/app_colors.dart';
import '../../core/utilities.dart';
import 'controller/track_form_controller.dart';
import 'track_form_card.dart';

class TrackForm extends StatefulWidget {
  const TrackForm({Key? key}) : super(key: key);

  @override
  State<TrackForm> createState() => _TrackFormState();
}

class _TrackFormState extends State<TrackForm> {
  final TackFormController controller = Get.put(TackFormController());

  @override
  void initState() {
    controller.getCategries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.black,
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => AppUtilities.getBack(context),
        ),
      ),
      floatingActionButton: Obx(() {
        if (controller.isUploadingData.isTrue) {
          return FloatingActionButton(
            onPressed: () {},
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        if (controller.answerList.isEmpty) {
          return const SizedBox.shrink();
        }
        return FloatingActionButton(
          onPressed: () {
            controller.submitAnswer();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${controller.answerList.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
          backgroundColor: Colors.blue,
        );
      }),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
                child: FadeInDown(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  right: 20.0,
                  left: 20.0,
                ),
                child: Text(
                  'You know the drill \nlet\'s go :)',
                  style: AppTextStyles.h35grey900,
                ),
              ),
            ))
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            if (controller.isFectingData.value == true) {
              return const CommonLoadingIndicator();
            }
            if (controller.errorFecthingData.value == true) {
              return const SomethingWentWrong();
            }
            if (controller.categoryList.isEmpty) {
              return const CommonEmptyError();
            }
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInUp(
                  child: TrackFormCard(
                    model: controller.categoryList[index],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
