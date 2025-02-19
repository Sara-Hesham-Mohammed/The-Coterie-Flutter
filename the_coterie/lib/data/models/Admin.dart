// Admin Model (Singleton Pattern)
class Admin {
  static final Admin _instance = Admin._internal();
  factory Admin() => _instance;
  Admin._internal();
}