import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Blogs Group Code

class BlogsGroup {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static Map<String, String> headers = {};
  static FetchPostCall fetchPostCall = FetchPostCall();
  static FetchCommentsCall fetchCommentsCall = FetchCommentsCall();
}

class FetchPostCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Post',
      apiUrl: '${BlogsGroup.baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {
        ...BlogsGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }
}

class FetchCommentsCall {
  Future<ApiCallResponse> call({
    String? postId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch comments',
      apiUrl: '${BlogsGroup.baseUrl}/posts/${postId}/comments',
      callType: ApiCallType.GET,
      headers: {
        ...BlogsGroup.headers,
      },
      params: {},
      returnBody: true,
    );
  }
}

/// End Blogs Group Code

class ReferAFriendCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "data": {
    "userIdentifier": "1234455667",
    "test1": "",
    "timestamp": 1666264482
  },
  "CheckSum": "1b4c7fb2d0d157df648a1006d649f02581b410fa3b3d44ac59e99c8e4aef16b8"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Refer a friend',
      apiUrl: 'http://10.30.150.85:9005/api/adapter/v1/referralCode',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
