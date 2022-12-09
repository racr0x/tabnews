import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tabnews/model/content.dart';
import 'package:tabnews/model/user.dart';

const _baseUrl = 'www.tabnews.com.br';

Future<UserLogin> login(String email, String password) async {
  var response =
      await doPost('/sessions', body: {'email': email, 'password': password});

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    return UserLogin(
        data['id'],
        data['token'],
        DateTime.parse(data['expires_at']),
        DateTime.parse(data['expires_at']),
        DateTime.parse(data['expires_at']));
  } else {
    var data = json.decode(response.body);
    throw data['message'] + ' ' + data['action'];
  }
}

Future<List<Content>> fetchContent(
    {int page = 1,
    ContentFetchStrategy strategy = ContentFetchStrategy.relevant}) async {
  var response = await doGet('/contents', queryParms: {
    'page': page.toString(),
    'per_page': '20',
    'strategy': strategy.name
  });

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);

    var contentList = <Content>[];

    for (var i = 0; i < data.length; i++) {
      Map<String, dynamic> item = data[i];
      DateTime? deletedAt;

      if (item['deleted_at'] != null) {
        deletedAt = DateTime.parse(item['deleted_at']);
      }

      contentList.add(Content(
          item['id'],
          item['owner_id'],
          item['slug'],
          item['title'],
          item['owner_username'],
          // ignore: prefer_interpolation_to_compose_strings
          ContentStatus.values.firstWhere(
              (e) => e.toString() == 'ContentStatus.' + item['status']),
          DateTime.parse(item['created_at']),
          DateTime.parse(item['updated_at']),
          DateTime.parse(item['published_at']),
          item['tabcoins'],
          item['children_deep_count'],
          parentId: item['parent_id'],
          sourceUrl: item['source_url'],
          deletedAt: deletedAt));
    }

    return contentList;
  } else {
    var data = json.decode(response.body);
    throw data['message'] + ' ' + data['action'];
  }
}

Future<dynamic> doGet(String path,
    {Map<String, dynamic> queryParms = const {}}) async {
  Uri uri = Uri.https(_baseUrl, '/api/v1$path', queryParms);

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  var response = await http.get(uri, headers: headers);
  return response;
}

Future<dynamic> doPost(String path,
    {Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParms = const {}}) async {
  Uri uri = Uri.https(_baseUrl, '/api/v1$path', queryParms);
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  var response = await http.post(uri, headers: headers, body: body);
  return response;
}
