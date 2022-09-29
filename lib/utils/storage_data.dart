// File? pickedFile;
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class Storagedata {
  Storagedata() {
    read();
  }
  // List<Map<String, String>> userdata = <Map<String, String>>[];
  var id;
  var username;
  var useremail;
  var profilepic;
  var program;
  var address;
  var bio;
  // List<String> userdata = <String>[];

  void write(data) {
    box.write("_id", data.id);
    box.write("user_name", data.userName);
    box.write("user_email", data!.userEmail);
    box.write("profilePicture", data!.profilePicture);
    box.write("program", data!.program);
    box.write("address", data!.address);
    box.write("bio", data!.bio);
    read();
  }

  void read() {
    id = box.read("_id");
    username = box.read("user_name");
    useremail = box.read("user_email");
    profilepic = box.read("profilePicture");
    program = box.read("program");
    address = box.read("address");
    bio = box.read("bio");
  }

  void deleteUser() {
    box.remove("token");
    box.remove("_id");
    box.remove("user_name");
    box.remove("user_email");
    box.remove("profilePicture");
    box.remove("program");
    box.remove("address");
    box.remove("bio");
    read();
  }

  void clearUser() {
    box.erase();
    
    read();
  }

//------------- Name Validator--------------//

}
