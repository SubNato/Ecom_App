# ecom_app

This new application, through the guidance and the grace of the Lord our God is one that is aimed to help in learning flutter, and Bloc.
This app, is an ecommerce app that has a built in authentification system connected with Firebase Google services. (ONLY NOTABLE FEATURES CURRENTLY. MORE WILL BE ADDED SHORTLY!)

Both the frontend, as well as the backend is manually developed, and any error that may be encountered by anyone else who would like to try to build this app themselves, I have resolved and listed below.



Problems I had:

- Gradle needed to be updated for Firebase Google Service to work.
- Gradle PLUGINS needed to be updated for the Firebase Google Services to work.

- Multidex needed to be enabled.
    * I solved that error by enabling the multidex, and such can be found in the **app level** gradle file in this project:
      multiDexEnabled = true          This could also be written as           multiDexEnabled true


-Dealing with the initial Firebase implementation, applying google services (firebase side) to the root (android) and app level gradle.

  Error received:          (This was the main issue faced with the authentication system. Praise God it was fixed. It took a while)
  " Build file 'C:' line: 19
  
  * What went wrong:
    Plugin [id: 'com.google.gms.google-services', version: '4.3.15', apply: false] was not found in any of the following sources:
  
  - Gradle Core Plugins (plugin is not in 'org.gradle' namespace)
  - Included Builds (None of the included builds contain this plugin)
  - Plugin Repositories (could not resolve plugin artifact 'com.google.gms.google-services:com.google.gms.google-services.gradle.plugin:4.3.15')
    Searched in the following repositories:
    Gradle Central Plugin Repository"

  Solution:
  
  Gradle needed to be updated for Google Service to work. 
  Gradle PLUGINS needed to be updated for the Google Services to work.   (So ensure that the tools you are using are up to date!)

  (The two above are a major part of the error's solution!)
  
  Google says to put id("com.google.gms.google-services") version "4.3.15" apply false in the root gradle 'plugins'.
  
  However, that did NOT work for me, so I placed it in the 'dependencies' section, under 'buildscript' within the ROOT LEVEL Gradle file. 
  I placed it as:
                                      classpath 'com.google.gms:google-services:4.3.15'  
  NOTE THE "gms:google-services" **AND NOT** "gms.google-services"          THE '.' SHOULD BE ':'. This was another main difference.
  
  SEE: https://youtu.be/w5WLVTeSGg0?si=ARq5j6uCz7ibHdLM        For more. I used it for some context as it showed his code then how he 
  fixed the error. You have to pay close attention though to match/ find what resembles your own code.


- As the project builds further, more wil be added to this file to help understand, and to solve any errors anyone using/building this code may face.

Hope this helps!


TO NOTE:
- 'pod install' did not work!


LOG 1: Remember in the gradle.wrapper.properties, it was 'gradle-8.3-all.zip', '- all  not - bin'


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
