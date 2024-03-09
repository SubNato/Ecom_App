class AppConstants{
  static const String SERVER_API_URL = "";     //Put your IP Address here for it to work. example: http://100.100.100.100:8000/      //In real life, use the domain name here and not this.
  static const String SERVER_UPLOADS = "${SERVER_API_URL}uploads/";
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile_key';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token_key';
}

//You could use ngrok to map the ip address so that you get an HTTPS (A SECURE) site so that everything loads well!


//Remember to change the IP Address in the network_security_config file
//before uploads/ running the app in oder to play the videos in the app!
//So either your IP Address, your domain name, or 10.0.2.2:8000, 8000 being the port number.
//Change it as well in the ".env" file in the backend for it to work as well as connect to the database and backend.

