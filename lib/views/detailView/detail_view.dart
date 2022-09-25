import 'package:acme/core/styles/app_text_styles.dart';
import 'package:acme/core/widgets/common_empty_error.dart';
import 'package:acme/core/widgets/common_loading_indicator.dart';

import 'package:acme/core/widgets/something_went_wrong.dart';
import 'package:acme/views/home/models/tracking_categories_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/services/firebase.dart';
import '../../core/styles/app_colors.dart';
import '../../core/utilities.dart';
import 'tracking_data_card.dart';
import 'tracking_data_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TrackingCategoriesModel model;
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
                child: FadeInDown(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  right: 20.0,
                  left: 20.0,
                ),
                child: Text(
                  'Let\'s get back in time \nAnd check your ${model.label} :)',
                  style: AppTextStyles.h35grey900.copyWith(fontSize: 24),
                ),
              ),
            ))
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder<QuerySnapshot<TarckingDataModel>>(
            stream: MyFirebaseServices().trackingDataStream(model.id),
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
                    TarckingDataModel tarckingDataModel = data[index].data();
                    return TrackingDataCard(
                      model: model,
                      tarckingDataModel: tarckingDataModel,
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
