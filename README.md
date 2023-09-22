# ecom_app

This new application, through the guidance and the grace of the Lord our God is one that is aimed to help in learning flutter, and Bloc.


Problems I had:

CONTEXT: Dealing with the initial Firebase implementation, applying google services (firebase side) to the root (android) and app level gradle.

" Build file 'C:\Users\taylo\OneDrive\Documents\Codes\ecom_app\android\build.gradle' line: 19

* What went wrong:
  Plugin [id: 'com.google.gms.google-services', version: '4.3.15', apply: false] was not found in any of the following sources:

- Gradle Core Plugins (plugin is not in 'org.gradle' namespace)
- Included Builds (None of the included builds contain this plugin)
- Plugin Repositories (could not resolve plugin artifact 'com.google.gms.google-services:com.google.gms.google-services.gradle.plugin:4.3.15')
  Searched in the following repositories:
  Gradle Central Plugin Repository"

Solution:     Google says to put id("com.google.gms.google-services") version "4.3.15" apply false in the root gradle 'plugins'

However, that did NOT work for me, so I placed it in the 'dependencies' section, under 'buildscript'. I placed it as:
                                    classpath 'com.google.gms:google-services:4.3.15'  
NOTE THE "gms:google-services" AND NOT "gms.google-services"          THE '.' SHOULD BE ':'. This was another main difference.

SEE: https://youtu.be/w5WLVTeSGg0?si=ARq5j6uCz7ibHdLM        For more. I used it for some context as it showed his code then how he fixed the error.



Hope this helps!

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
