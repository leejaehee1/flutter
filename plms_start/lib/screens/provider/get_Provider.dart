import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  Future<Response> getUser(String id) => get('http://10.0.2.2:5000/api/$id');
  // Post request
  Future<Response> postUser(dynamic data) =>
      post('http://10.0.2.2:5000/api', data);

  // post('http://10.0.2.2:5000/api', body: data);
  // Post request with File
  Future<Response> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }

  GetSocket userMessages() {
    return socket('https://yourapi/users/socket');
  }
}
