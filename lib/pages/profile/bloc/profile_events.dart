import 'package:ecom_app/entities/entities.dart';

abstract class ProfileEvents{
  const ProfileEvents();
}

class TriggerProfileName extends ProfileEvents{
  final UserItem userProfile;
  const TriggerProfileName(this.userProfile);
}