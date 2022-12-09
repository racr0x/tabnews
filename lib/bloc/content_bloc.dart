import 'package:flutter/foundation.dart';
import 'package:tabnews/apis/tabnews_apis.dart';
import 'package:tabnews/model/content.dart';
import 'package:tabnews/services/locator.dart';

class ContentBloc extends ChangeNotifier{
  var contentList = getIt.get<ContentList>();
  var isLoading = true;

  Future<void> fetchContentFromApi() async {
    contentList.list.addAll(await fetchContent());
    isLoading = false;
    notifyListeners();
  }
}