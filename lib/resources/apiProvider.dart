import 'package:pelis/http/httpHandler.dart';

class ApiProvider extends HttpHandler {
  static final _apiProvider = new ApiProvider();

  static ApiProvider get() {
    return _apiProvider;
  }
}
