import 'dart:collection';

class ApiUrl {
  ///SignUP url(POST)
  static var signupUrl =
      Uri.parse('https://abhinavsocialmedia.herokuapp.com/api/v1/user/signup');

  ///login url(POST)
  static var loginUrl =
      Uri.parse('https://abhinavsocialmedia.herokuapp.com/api/v1/user/login');

  ///otp url(POST)
  static var verifyMobileOtp = Uri.parse(
      'https://abhinavsocialmedia.herokuapp.com/api/v1/user/verifyMobileOtp');

  ///add Post(POST)
  static var addPost =
      Uri.parse('https://abhinavsocialmedia.herokuapp.com/api/v1/user/addpost');

  static var addPostLink =
      'https://abhinavsocialmedia.herokuapp.com/api/v1/user/addpost';
///GET
  static var getPost = Uri.parse(
      "https://abhinavsocialmedia.herokuapp.com/api/v1/user/getposts");

///GET
 static var deletePost = Uri.parse("https://abhinavsocialmedia.herokuapp.com/api/v1/user/deletePost");

}



