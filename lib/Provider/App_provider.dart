import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glaucoma_app/Model/User_Model.dart';
import 'package:glaucoma_app/Repo/App_repo.dart';
import 'package:glaucoma_app/UI/HeroSection/heroSection.dart';

class AppProvider extends ChangeNotifier {
  User curent_user;
  Repo _repo = Repo();

  void login(email, password, context) {
    _repo.fetchUser(email, password).then((value) {
      curent_user = value;
      print(curent_user.email);
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeroScreen()),
      );
    });
  }

  void signup({f_name, l_name, email, password, context}) {
    _repo.fetchUsersignup(f_name, l_name, email, password).then((value) {
      curent_user = value;
      print(curent_user.f_name);
      print(curent_user.l_name);
      print(curent_user.email);
      print(curent_user.password);
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeroScreen()),
      );
    });
  }
}
