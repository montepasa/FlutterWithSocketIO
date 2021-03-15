import 'dart:async';

import 'package:oops/model/user_model.dart';

class Auth {
  Future<bool> signIn(String phone) async{
    return true;
  }

  Future<bool> signOut() async{
    return true;
  }

  Future<UserModel> getUser() async{
    return new UserModel();
  }
}

