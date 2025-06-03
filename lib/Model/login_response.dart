final class LoginResponse {
  final String? username;
  final String? userId;
  final String? userOrgCode;
  final String? userSolId;

  LoginResponse({
    required this.username,
    required this.userId,
    required this.userOrgCode,
    required this.userSolId,
  });

  @override
  String toString() {
    return ''' LoginResponse{ username: $username , userid $userId 
        userOrgCode $userOrgCode userSolid $userSolId
     } ''';
  }
}
