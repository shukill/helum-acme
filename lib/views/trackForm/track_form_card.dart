import '../../core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/styles/app_colors.dart';
import '../../core/widgets/my_cached_network_image.dart';
import '../home/models/tracking_categories_model.dart';
import 'controller/track_form_controller.dart';

class TrackFormCard extends StatefulWidget {
  const TrackFormCard({Key? key, required this.model}) : super(key: key);
  final TrackingCategoriesModel model;

  @override
  State<TrackFormCard> createState() => _TrackFormCardState();
}

class _TrackFormCardState extends State<TrackFormCard> {
  late TextEditingController textEditingController;
  bool isValid = false;
  final TackFormController controller = Get.put(TackFormController());
  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty) {
        if (isValid == false) {
          setState(() {
            isValid = true;
          });
        }
      } else {
        if (isValid == true) {
          setState(() {
            isValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
          color: HexColor(widget.model.hexCode),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    (widget.model.link.contains('.svg'))
                        ? SvgPicture.asset(widget.model.link)
                        : MyCachedNetworkImage(
                            url: widget.model.link,
                            height: 35,
                            width: 35,
                            borderRadius: 6,
                          ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      widget.model.label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                isValid
                    ? Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
                        ))
                    : const SizedBox()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Enter your ${widget.model.label} in ${widget.model.unit}?",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 45,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.black.withOpacity(0.8),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: textEditingController,
                        style: AppTextStyles.textField,
                        onChanged: (String value) {
                          controller.updateAnswer(
                            id: widget.model.id,
                            value: value,
                          );
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
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
