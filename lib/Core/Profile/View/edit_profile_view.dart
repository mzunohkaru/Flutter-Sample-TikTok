import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Core/Profile/ViewModel/profile_view_model.dart';
import 'package:tiktok_clone/Utils/constants.dart';

class EditProfileView extends HookConsumerWidget {
  File? _imageFile;
  final String initialUsername;
  final String initialAddress;
  final viewModel = ProfileViewModel();

  EditProfileView({
    super.key,
    required this.initialUsername,
    required this.initialAddress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController(text: initialUsername);
    final addressController = useTextEditingController(text: initialAddress);
    final isLoading = useState(false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Edit Profile", style: kAppBarTitleTextStyle,),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: !isLoading.value
                ? () async {
                    isLoading.value = true;
                    await viewModel.updateProfile(
                        ref: ref,
                        username: usernameController.text,
                        address: addressController.text,
                        profileImage: _imageFile);
                    isLoading.value = false;
                    Navigator.pop(context);
                  }
                : null,
            child: isLoading.value
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : const Text(
                    "Dane",
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _imageFile = File(pickedFile.path);
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                      child: _imageFile == null
                          ? const Icon(Icons.person, size: 40)
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'ユーザー名',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'アドレス',
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
