
import 'package:flutter/material.dart';

import 'reusable_widgets.dart';

class DecorationProperties {


  static BoxDecoration leaderboardBackgroundDecoration = BoxDecoration(
      image: DecorationImage(
          image:AssetImage("assets/images/bg.png"),

          fit: BoxFit.fill));



  static BoxDecoration editProfileBackgroundDecoration = BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
          image: ReusableWidgets.getAssetImage("edit_profile_bg.png"),
          fit: BoxFit.fill));

}
