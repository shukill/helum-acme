import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../core/widgets/my_cached_network_image.dart';
import '../home/models/tracking_categories_model.dart';
import 'tracking_data_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class TrackingDataCard extends StatelessWidget {
  const TrackingDataCard({
    Key? key,
    required this.model,
    required this.tarckingDataModel,
  }) : super(key: key);
  final TrackingCategoriesModel model;
  final TarckingDataModel tarckingDataModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: HexColor(model.hexCode),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    (model.link.contains('.svg'))
                        ? SvgPicture.asset(model.link)
                        : MyCachedNetworkImage(
                            url: model.link,
                            height: 30,
                            width: 30,
                            borderRadius: 6,
                          ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Added ' + timeago.format(tarckingDataModel.uploadedTime),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 40,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.black.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Text(
                        '${tarckingDataModel.value} ${model.unit}',
                        style: AppTextStyles.textField.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
