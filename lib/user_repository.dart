class User {
  String name;
  String email;
  String contactNumber;
  String password;
  String? profileImage; // Nullable to handle no image initially

  User({
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.password,
    this.profileImage,
  });
}


class UserRepository {
  final List<User> _users = [];

  bool emailExists(String email) {
    return _users.any((user) => user.email == email);
  }

  void addUser(User user) {
    _users.add(user);
  }

  User? getUserByEmail(String email) {
    try {
      return _users.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }
}
