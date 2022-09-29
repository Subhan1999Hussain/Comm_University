
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
File? pickedFile;
class PickImage {
    ImagePicker imagePicker = ImagePicker();
  var isprofilepicpathset = false.obs;
  var profilepicpath = "".obs;
  
  void setprofilepath(String path) {
    profilepicpath.value = path;
    isprofilepicpathset.value = true;
  }

  void takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 25);
    _cropImage(pickedImage!.path);
  }

  void _cropImage(filePath) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    pickedFile = File(croppedImage!.path);
    setprofilepath(pickedFile!.path);
    Get.back();
  }




  // static void confirm_password_hideIcon() {
  //   if (isHideconfirmpassword.value) {
  //     isHideconfirmpassword.value = false;
  //   } else {
  //     isHideconfirmpassword.value = true;
  //   }
  // }

//------------- Name Validator--------------//
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Enter UserName";
    }
    return null;
  }


}

