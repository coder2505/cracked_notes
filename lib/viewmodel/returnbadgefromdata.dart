import 'package:cracked_notes/data/badge_data.dart';
import 'package:flutter/material.dart';


Image returnBadge(String name){

  return badgeRef[name] ?? Image.asset('assets/dummy_img/prettybadge.png');

}