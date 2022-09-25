import 'dart:developer';
import 'dart:io';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/my_cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

import 'home/models/tracking_categories_model.dart';

class AdminFormPage extends StatefulWidget {
  const AdminFormPage({Key? key}) : super(key: key);

  @override
  State<AdminFormPage> createState() => _AdminFormPageState();
}

class _AdminFormPageState extends State<AdminFormPage> {
  bool isLoading = false;
  File? file;
  String? imgUrl;
  TextEditingController hexCode = TextEditingController();
  TextEditingController order = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController label = TextEditingController();
  TextEditingController unit = TextEditingController();

  //
  FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  TrackingCategoriesModel trackingModel = TrackingCategoriesModel(
      hexCode: '#000000', label: '', link: '', type: 'text', unit: '', id: '');

  Future<String?> uploadFile(File file) async {
    String? imgUrl;
    final int name = DateTime.now().millisecondsSinceEpoch;
    var ext = file.path.split('.').last;
    log('@@ this is extension : $ext');
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseStorage.instance.ref('img/$name.$ext').putFile(file);
      imgUrl = await storage.ref('img/$name.$ext').getDownloadURL();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      log(e.message.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    return imgUrl;
  }

  Future<bool> createTrack(TrackingCategoriesModel model, String id) async {
    setState(() {
      isLoading = true;
    });
    var res = false;
    try {
      await _firebaseFirestore.collection('track').doc(id).set(model.toMap());
      res = true;
    } on FirebaseException catch (e) {
      res = false;
      log(e.message!);
    } finally {
      setState(() {
        isLoading = false;
      });
    }

    return res;
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      file = File(result.files.single.path!);
      imgUrl = await uploadFile(file!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Categories',
          style: AppTextStyles.p16Black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.secondaryBackground.withOpacity(0.3),
                ),
                child: Text(
                  'This UI is just to upload new tracking categories to database instead of manually uploading it - Feel free to explore or ignore , nothing much going on here :)',
                  style: AppTextStyles.p16Black.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  pickFile();
                },
                child: file == null
                    ? const MyCachedNetworkImage(
                        url:
                            'https://images.unsplash.com/photo-1599226335946-faf96a7cc10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=834&q=80',
                        height: 100,
                        width: 100,
                        borderRadius: 30,
                      )
                    : CircleAvatar(
                        radius: 52,
                        backgroundImage: Image.file(file!).image,
                      ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CustomTextField(
                  controller: label,
                  hintText: 'Label',
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CustomTextField(
                  controller: unit,
                  hintText: 'Unit',
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CustomTextField(
                  controller: type,
                  hintText: 'Type',
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CustomTextField(
                  controller: hexCode,
                  hintText: 'Hexcode',
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: CustomTextField(
                  controller: order,
                  hintText: 'Order',
                  onChanged: (val) {},
                ),
              ),
              const SizedBox(height: 40),
              isLoading
                  ? const AppButton(lable: 'Loading...')
                  : Center(
                      child: AppButton(
                        lable: 'Submit',
                        onTap: () async {
                          final String id = const Uuid().v4();
                          trackingModel = TrackingCategoriesModel(
                            link: imgUrl ??
                                'https://images.pexels.com/photos/4397840/pexels-photo-4397840.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            hexCode: hexCode.text,
                            type: type.text,
                            unit: unit.text,
                            label: label.text,
                            id: id,
                          );
                          await createTrack(trackingModel, id);
                          Fluttertoast.showToast(msg: 'Category created!');
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 15, top: 5),
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.p12Black,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
              ),
            )),
      ),
    );
  }
}
