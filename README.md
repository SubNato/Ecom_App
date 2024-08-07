# ecom_app

This mobile application allows teachers to upload courses for students to purchase. 
Using Android Studio, this project was developed with the Flutter/ Dart development tools and language respectively which also utilized Bloc.
It incorporates a Laravel backend with manually developed APIs that connects and communicates with the frontend of the mobile application.
The database used within this project is MySQL which is controlled using XAMPP Control panel for ease of use.

Within this application are different features such as:
 A fully developed and working LogIn feature controlled by Google Firebase
 STRIPE Payment system feature for a secure payment system
 Sanctum security features
 As well as a chat feature and so much more!

This is a personal project that was to developed to help in learning more about how to code in Dart programming language as well as how to use the Flutter framework!
Everything was manually developed as I took the time to learn how it was built and the understanding behind everything that was done to boost my own knowledge on developing apps!


In building this project, I used resources from dbestech and also other tutorials that expounded upon this framework. 

Below I have listed some errors that I have found and dealt with to help in troubleshooting for anyone interested. God speed!



Problems I had:

New Error: 


- Gradle needed to be updated for Firebase Google Service to work.
- Gradle PLUGINS needed to be updated for the Firebase Google Services to work.

- Multidex needed to be enabled.
    * I solved that error by enabling the multidex, and such can be found in the **app level** gradle file in this project:
      multiDexEnabled = true          This could also be written as           multiDexEnabled true


-Dealing with the initial Firebase implementation, applying google services (firebase side) to the root (android) and app level gradle.

Error received:          (This was the main issue faced with the authentication system. Praise God it was fixed. It took a while)
" Build file 'C:' line: 19

- Gradle needed to be updated for Firebase Google Service to work.
- Gradle PLUGINS needed to be updated for the Firebase Google Services to work.

- Multidex needed to be enabled.
    * I solved that error by enabling the multidex, and such can be found in the **app level** gradle file in this project:
      multiDexEnabled = true          This could also be written as           multiDexEnabled true


-Dealing with the initial Firebase implementation, applying google services (firebase side) to the root (android) and app level gradle.

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


New Error:

This error came out of the blue, so watch out and don't get depressed about it.
- Error with the multiDex. It said it needs to be enabled, while I have already enabled it and enabled
flutter multiDex support along with that as well..

FIX: I prayed about it, left it for a while, then a new error came up:

Execution failed for task ':app:compileDebugKotlin'.
> Cannot access output property 'destinationDirectory' of task ':app:compileDebugKotlin'. Accessing unreadable inputs or outputs is not supported. Declare the task as untracked by using Task.doNotTrackState(). For more information, please refer to https://docs.gradle.org/8.3/userguide/incremental_build.html#disable-state-tracking in the Gradle documentation.
> java.io.IOException: Cannot snapshot C:
>    Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

In trying to fix it, more issues came up, so I just used the "git checkup" command in the terminal
Then went back to the original commit I first made on github.

So ultimately, I changed the minSDKversion to 21 in the app level gradle file which ahs its own multiDex enabled automatically.

I didn't want to do that originally, as I wanted to fix the problem at its core, so that older version users wouldn't have an issue.
However, after getting no other fixes for it I used this fix, and praise be to God it worked!!!!!

SEE:  https://developer.android.com/build/multidex          FOR AN OVERALL VIEWPOINT AND FIX
OR :   https://developer.android.com/build/multidex#mdex-on-l            FOR THE MINSDKVERSION FIX MENTIONED ABOVE!


New Error:
Execution failed for task ':app:mergeDebugResources'.
> Cannot access output property 'blameLogOutputFolder' of task ':app:mergeDebugResources'. Accessing unreadable inputs or outputs is not supported. Declare the task as untracked by using Task.doNotTrackState().

FIX:

Remember to take out the implementation of the multiDex in the dependency section of the app level gradle file. After I took it out, it started to work again!

New Error:

-A problem occurred configuring project ':fluttertoast'.
Could not create an instance of type com.android.build.api.variant.impl.LibraryVariantBuilderImpl.

FIX: 
For this error, I saw where someone got the same issue and explained that he took out fluttertoast, that was really giving the error. However, for this project fluttertoast is needed.
Most errors from others showed/stated that taking out the package from the 'AndroidManifest.xml' and placing it in the module gradle file would work, however for this project it was already there and there was no package label in the 'AndroidManifest.xml' file.

What helped, praise be to God, was to downgrade the **GRADLE PLUGINS** and **NOT** the **GRADLE VERSION**!!!!! from the project to 7.4.2 from the 8.0.2 that it wan on. I saw where others said to use this and to do it manually or using the AGP upgrade assistant. However, the AGP upgrade assistant was not working/coming up when clicked on multiple times and tries.
Manually I tried from the file tab on the main ribbon, but I could not find it. I went into the app level gradle file, and a pop-up came up in the form of a 'ribbon', and it said 'open for editing in android studio'. I clicked that option and in there, sometimes an option comes up similar to what was mentioned before prompting another edit.
The shortcut it would give/show is to use, 'ctrl+alt+shift+s' to open the project structure showing the gradle plugin that is being used. From there, you can upgrade and downgrade as you please. Also, in this new window if you use the file then project structure it works as well. However, in the main project that method of 'file then project structure' does not show the GRADLE PLUGINS needed to be changed.
In this case DOWNGRADE to the 7.4.2 option and the error is solved.

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


FYI, sorry for the lengthy fix. It took me a while to solve it, and this is a summary of what transpired! Later for now.

- As the project builds further, more wil be added to this file to help understand, and to solve any errors anyone using/building this code may face.

New Error:

-type 'Null' is not a subtype of type 'SingleChildWidget'

Fix:

Usually a return statement is left out, search for that. In this case I left the application route uncommented with the application route bloc not started. There was no bloc to return so an error was thrown. Comment it out if you have something like that.



New Error:


Connection closed while receiving data, uri

fix:




-New Error:

'AuthProvider' is imported from both 'package:firebase_auth_platform_interface/src/auth_provider.dart' and 'package:firebase_ui_auth/src/providers/auth_provider.dart'.
import 'src/providers/auth_provider.dart';

Fix:

Seemingly the new updated file has similar naming conventions hence the error. So one fix could be to use aliases or another could be to update outdated dependencies or to downgrade updated dependencies. Lets see!


Refer to here for more details to fix the error above:
https://stackoverflow.com/questions/77468892/error-authprovider-is-imported-from-both


New error:

Could not resolve all files for configuration ':app:debugRuntimeClasspath'.
Flutter fix was to disable Shrinker by using '--no-shrink' flag to this command.

Actual fix used before trying the above method:
In the app/build.gradle file under the 'buildtypes' subfile 'release'  we added 'minifyEnabled true'. (It is marked in the file listed in the actual app)

Actual fix: Upgraded the minSDKVersion from 21 to 26. That has thrown an error before (Very early on in building the app), so I hesitated to. Thank God it worked out now!
So simply upgrade your minSDKVersion from 21 to 26 or the latest version of your minSDK.


Not really an error, but in trying to install firestore-option in the teacher side chat page/app.

I tried to run 'firebase' commands after installing firebase cli, and also Node js. for npm commands, however it did not work, mountains of errors.
So I kept the firebase CLI files and followed instructions from here on how to install it without using DIRECT 'firebase' commands:
https://stackoverflow.com/questions/70404936/missing-firebase-options-dart-file-in-course-get-to-know-firebase-for-flutter


Long story short, I used 'dart pub global activate flutterfire_cli' in the android studio app's terminal, attached the well needed system variables to the SYSTEM's PATH variables, quick computer restart, then flutterfire configure worked!
However, all in all you still need to DOWNLOAD and configure firebase_cli, for any of this to work. I recommend googling and reading up on the https://firebase.google.com/docs/cli website for more info and it also makes it 100% clear on how it works. How it runs per project, not so much.


Firebase CLI Information:
https://firebase.google.com/docs/cli






CLEAR



- As the project builds further, more wil be added to this file to help understand, and to solve any errors anyone using/building this code may face.

Hope this helps!

TO NOTE:

- 'pod install' did not work? Maybe run the ios emulator first then run pod install on terminal. So download, or get the ios phone emulator and run the app on it, then use pod install to see if it works.

- 'pod install' did not work!



LOG 1: Remember in the gradle.wrapper.properties, it was 'gradle-8.3-all.zip', '- all  not - bin'


Backend Usage:

laravel-admin.org/docs/en

php artisan serve : "Is used to start the laravel server."

Learn more about it!   (Laravel and APIs).
