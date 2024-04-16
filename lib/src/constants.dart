import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//Text Colors

const Color black = Color(0xff20262C);
const Color lightblack = Color(0xff5F5F60);

//App Colors

const Color accentcolor = Color(0xff77b3ab);
const Color background = Color(0XFFFFFFFF);
const Color white = Color(0xfff8f8f8);

//TextStyle

final heading1 = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 16.sp,
  color: black,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.8,
  height: 0.9,
  overflow: TextOverflow.clip,
);

final heading2 = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 14.sp,
  color: accentcolor,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.4,
  height: 0.9,
  overflow: TextOverflow.clip,
);
final title = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 13.sp,
  color: black,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.18,
  overflow: TextOverflow.clip,
);

final subttitle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12.sp,
  color: lightblack,
  letterSpacing: 0.18,
  fontWeight: FontWeight.w400,
  overflow: TextOverflow.clip,
);
final asubttitle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12.sp,
  color: accentcolor,
  letterSpacing: 0.18,
  fontWeight: FontWeight.w400,
  overflow: TextOverflow.clip,
);
final wsubttitle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12.sp,
  color: background,
  letterSpacing: 0.18,
  fontWeight: FontWeight.w400,
  overflow: TextOverflow.clip,
);
EdgeInsets contentpadding = const EdgeInsets.symmetric(
  horizontal: 10,
  vertical: 10,
);
EdgeInsets bodypadding = const EdgeInsets.symmetric(
  horizontal: 25,
  vertical: 20,
);
List<BoxShadow> shadow = <BoxShadow>[
  BoxShadow(
    color: accentcolor.withOpacity(0.4),
    blurRadius: 10,
    spreadRadius: 3,
  ),
];
List<BoxShadow> lightshadow = <BoxShadow>[
  BoxShadow(
    color: white.withOpacity(0.4),
    blurRadius: 10,
    spreadRadius: 3,
  ),
];
