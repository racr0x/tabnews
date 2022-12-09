import 'package:get_it/get_it.dart';
import 'package:tabnews/model/content.dart';
import 'package:tabnews/model/user.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<User>(User());
  getIt.registerSingleton<ContentList>(ContentList());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}