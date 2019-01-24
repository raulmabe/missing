import 'package:flutter/material.dart';

class UserViewModel {
  AssetImage image;
  int id;
  String name;
  int founds;
  int missings;
  
  String location;

  UserViewModel(
      {this.image,
      this.id,
      this.name,
      this.founds,
      this.missings,
      this.location,});
}

UserViewModel user = UserViewModel(
  image: AssetImage("assets/profile_pic.jpg"),
id: 1,
name: "Raul Mateo Beneyto",
founds: 0,
missings: 2,
location: "Premià de Mar, Barcelona"
);