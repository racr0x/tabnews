class User{
  String username = '', email = '';
  bool notification = true;
  UserLogin login = UserLogin.empty();

  get hasLogin => login.id.isNotEmpty;
  get isLogged => hasLogin && login.isNotExpired;

}

class UserLogin {
  String id = '', token = '';
  DateTime expiresAt = DateTime.now(),
      createdAt = DateTime.now(),
      updatedAt = DateTime.now();

  UserLogin(this.id, this.token, this.expiresAt, this.createdAt, this.updatedAt);
  UserLogin.empty();

  get isExpired => expiresAt.isBefore(DateTime.now());
  get isNotExpired => !isExpired;
}
