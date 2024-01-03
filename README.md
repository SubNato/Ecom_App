# ecom_app




Problems I had:




-Dealing with the initial Firebase implementation, applying google services (firebase side) to the root (android) and app level gradle.



FYI, sorry for the lengthy fix. It took me a while to solve it, and this is a summary of what transpired! Later for now.

- As the project builds further, more wil be added to this file to help understand, and to solve any errors anyone using/building this code may face.

New Error:

-type 'Null' is not a subtype of type 'SingleChildWidget'

Fix:

Usually a return statement is left out, search for that. In this case I left the application route uncommented with the application route bloc not started. There was no bloc to return so an error was thrown. Comment it out if you have something like that.



New Error:


Connection closed while receiving data, uri

fix:




- As the project builds further, more wil be added to this file to help understand, and to solve any errors anyone using/building this code may face.

Hope this helps!


TO NOTE:



LOG 1: Remember in the gradle.wrapper.properties, it was 'gradle-8.3-all.zip', '- all  not - bin'


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.






Key things to note when dealing with GitHub:

command 'git log' is used to see all logs made in a specific github repository that you are working in.

press 'Q' to EXIT out of the github log after the command above is used.

command 'git checkout' 'with the id/hash' is used to jump to the previous code you committed to a specific github repository.
Be careful using 'git checkout'!

command 'git revert' is used to revert to the last commit, or a commit made previously on github after you committed another change to a specific github repository.

command 'git stash' can be used to store your current work (not a commit, nor on the main branch), so that it won't get lost.

THESE LISTED ABOVE can be done in both the TERMINAL and in ANDROID STUDIO GUI.




Backend Usage:

laravel-admin.org/docs/en

php artisan serve : "Is used to start the laravel server."

Learn more about it!   (Laravel and APIs).