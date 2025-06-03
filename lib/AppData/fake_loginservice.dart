import 'package:newsee/Model/login_request.dart';
import 'package:newsee/Model/login_response.dart';
import 'package:newsee/blocs/login/login_bloc.dart';

class FakeLoginservice {
  const FakeLoginservice();

  Future<LoginState> login({required LoginRequest loginRequest}) async {
    return Future.delayed(Duration(milliseconds: 10000), () {
      print('$loginRequest');
      if (loginRequest.username == 'admin' &&
          loginRequest.password == 'admin') {
        return LoginState(
          loginStatus: LoginStatus.success,
          loginResponse: LoginResponse(
            username: '',
            userId: '',
            userOrgCode: '',
            userSolId: '',
          ),
        );
      } else {
        //throw StateError('Invalid Credentials...Try Again');
        return LoginState(
          loginStatus: LoginStatus.error,
          loginResponse: LoginResponse(
            username: '',
            userId: '',
            userOrgCode: '',
            userSolId: '',
          ),
        );
      }
    });
  }
}
