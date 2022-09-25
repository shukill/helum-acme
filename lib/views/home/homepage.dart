import '../../core/constants/routes.dart';
import '../../core/utilities.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/common_empty_error.dart';
import '../../core/widgets/common_loading_indicator.dart';
import '../../core/widgets/something_went_wrong.dart';
import '../admin_form.dart';
import '../../core/services/firebase.dart';
import '../trackForm/track_form.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import 'components/tacking_category_card.dart';
import 'models/tracking_categories_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppButton(
        lable: 'Start Tracking',
        onTap: () {
          AppUtilities.navigateTo(context, const TrackForm(), Routes.trackForm);
        },
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          AppConstans.appName,
          style: AppTextStyles.work25Black,
        ),
        centerTitle: true,
        leading: IconButton(
          color: AppColors.black,
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => AppUtilities.getBack(context),
        ),
        actions: [
          IconButton(
            color: AppColors.black,
            onPressed: () {
              AppUtilities.navigateTo(
                context,
                const AdminFormPage(),
                Routes.adminFormPage,
              );
            },
            icon: const Icon(
              Icons.admin_panel_settings_rounded,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(0, 1),
                      )
                    ]),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg:
                                'Sorry! Couldn\'t implement search time constrain :(',
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.black,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        cursorColor: AppColors.black,
                        onEditingComplete: (() => Fluttertoast.showToast(
                              msg:
                                  'Sorry! Couldn\'t implement search time constrain :(',
                            )),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for categories",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              StreamBuilder<QuerySnapshot<TrackingCategoriesModel>>(
                stream: MyFirebaseServices().trackingCategoryStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CommonLoadingIndicator();
                  }
                  if (snapshot.hasError == true) {
                    return const SomethingWentWrong();
                  }
                  if (snapshot.hasData == false) {
                    return const CommonEmptyError();
                  }
                  var data = snapshot.data!.docs;

                  return FadeInRight(
                    child: Column(
                      children: List.generate(data.length, (index) {
                        TrackingCategoriesModel trackingCategoriesModel =
                            data[index].data();
                        return TackingCategoryCard(
                          trackCategory: trackingCategoriesModel,
                        );
                      }),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
