part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser({
    String name = "No Name",
    String selectedLanguage = "English",
    List<String> selectedGenres = const [],
    int balance = 50000
  }) =>
      User(this.uid,
          this.email,
          name:name,
          selectedGenres:selectedGenres,
          selectedLanguage:selectedLanguage,
          balance:balance);

  Future<User> fromFireStore() => UserServices.getUser(this.uid);
}