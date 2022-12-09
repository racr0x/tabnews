import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tabnews/model/user.dart';

final getIt = GetIt.instance;

class SessionManagerBloc extends ChangeNotifier{
  var user = getIt.get<User>;  
  var errorMessage = '';
  bool isLoading = false;

  Future<void> login() async {
    isLoading = true;
    notifyListeners();

    

    isLoading = false;
    notifyListeners();
    return;
  }


}