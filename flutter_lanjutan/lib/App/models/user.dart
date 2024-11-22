class User {
  final String accessToken;
  final String refreshtoken;
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastname;
  final String gender;
  final String image;

  User(
      {this.accessToken = "",
      this.refreshtoken = "",
      this.id = 0,
      this.username = "",
      this.email = "",
      this.firstName = "",
      this.lastname = "",
      this.gender = "",
      this.image = ""});
}
