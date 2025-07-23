// ignore_for_file: use_build_context_synchronously, document_ignores

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Future<File?> showImagePicker(BuildContext context) async {
  return showModalBottomSheet<File?>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Align(
              child: Container(
                height: 10,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Please take a clear selfie to verify your identity at the station.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(LineAwesomeIcons.camera_retro_solid),
              title: const Text('Take a verification photo'),
              onTap: () async {
                final selectedImage = await pickImage(ImageSource.camera);
                if (selectedImage != null) {
                  context.pop(selectedImage);
                }
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      );
    },
  );
}

Future<File?> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source, imageQuality: 20);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}
