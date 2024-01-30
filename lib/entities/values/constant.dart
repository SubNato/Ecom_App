class AppConstants{
  static const String SERVER_API_URL = "http://192.168.0.2:8000/";     //Put your IP Address here for it to work. example: http://100.100.100.100:8000/      //In real life, use the domain name here and not this.
  static const String SERVER_UPLOADS = "${SERVER_API_URL}uploads/";
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile_key';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token_key';
}
