import 'package:glaucoma_app/Model/User_Model.dart';
import 'package:glaucoma_app/service/api_service.dart';

class Repo {
  ApiService _service = ApiService();

  Future<User> fetchUser(email, password) {
    return _service.login(email, password);
  }

  Future<User> fetchUsersignup(f_name, l_name, email, password) {
    return _service.signup(f_name, l_name, email, password);
  }
}
