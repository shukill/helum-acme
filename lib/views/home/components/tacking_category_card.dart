import '../../../core/utilities.dart';
import '../../detailView/detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/styles/app_colors.dart';
import '../models/tracking_categories_model.dart';

class TackingCategoryCard extends StatelessWidget {
  const TackingCategoryCard({
    Key? key,
    required this.trackCategory,
  }) : super(key: key);

  final TrackingCategoriesModel trackCategory;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey(trackCategory),
      child: InkWell(
        onTap: () {
          AppUtilities.navigateTo(
            context,
            DetailView(model: trackCategory),
            trackCategory.id,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 1),
                )
              ],
              color: AppColors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: Center(
                    child: (trackCategory.link.endsWith('.svg'))
                        ? Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: HexColor(trackCategory.link),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: SvgPicture.network(
                              trackCategory.link,
                            ),
                          )
                        : Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  trackCategory.link,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        trackCategory.label,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        trackCategory.unit,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
