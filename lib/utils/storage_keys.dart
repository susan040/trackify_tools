// import 'dart:convert';
// import 'dart:developer';

// class StorageKeys {
//   static const String USER = "user";
//   static const String ACCESS_TOKEN = "accessToken";
// }

// class StorageHelper {
//   static getToken() {
//     try {
//       final box = GetStorage();
//       String token = box.read(StorageKeys.ACCESS_TOKEN);
//       return token;
//     } catch (e, s) {
//       log(e.toString());
//       log(s.toString());
//       return null;
//     }
//   }

//   static Users? getUser() {
//     log("Fetching user");
//     try {
//       final box = GetStorage();
//       log("Fetching user1");
//       Users user = Users.fromJson(json.decode(box.read(StorageKeys.USER)));
//       return user;
//     } catch (e, s) {
//       log(e.toString());
//       log(s.toString());
//       log("Failed fetch user");
//       return null;
//     }
//   }
// }
