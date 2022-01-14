import 'package:flutter/cupertino.dart';

abstract class UserEvent {}

class UserLoadEvent extends UserEvent {}

class UserSearchEvent extends UserEvent {
  String searchString;
  UserSearchEvent({
    @required this.searchString,
  });
}

class UserClearEvent extends UserEvent {}
