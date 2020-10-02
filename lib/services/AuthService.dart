import 'package:flutter_xmllayout_example/models/LoginResult.dart';
import 'package:rxdart/subjects.dart';
import 'PersistentStorage.dart';


class AuthService {
  final status = BehaviorSubject<bool>.seeded(false);
  String _token = '';
  String get token => _token;
  final PersistentStorage _storage;

  AuthService(this._storage);

  Future<LoginResult> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 4));
    return _parepareLoginResult('test_token', '');
  }
  
  LoginResult _parepareLoginResult(String token, String error) {
    final result = LoginResult(
      succeeded: (error == null || error.isEmpty) && token != null && token.isNotEmpty,
      token: token,
      error: error
    );

    _token = result.token;
    status.value = result.succeeded;
    
    if (result.succeeded) {
      _storage.setToken(result.token);
    }

    return result;
  }

  void coldLogin() {
    _token = _storage.getToken();
    if (_token != null && _token.isNotEmpty) {
      // todo check expiration
      status.value = true;
    }
  }
}
