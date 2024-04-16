import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 class NavBar extends StatelessWidget {
     final int index;
  final Function(int i) function;
   const NavBar({super.key,required this.function, required this.index,});
 
   @override
   Widget build(BuildContext context) {
    List<CustomNavigationBarItem> items= [
    CustomNavigationBarItem(icon: FaIcon(index ==0 ?FontAwesomeIcons.house:FontAwesomeIcons.houseChimney,),),
    CustomNavigationBarItem(icon: FaIcon(index==1?FontAwesomeIcons.cartShopping: FontAwesomeIcons.cartShopping,),),
    
  ];
    return Container(
      decoration: BoxDecoration(
        color:const Color(0xfff2f2f2),
        boxShadow: [
          BoxShadow(
            blurRadius: 9,
            color: const Color(0xff000000).withOpacity(0.55),
          ),
        ],
      ),
      child: SafeArea(
        child: CustomNavigationBar(
          selectedColor: Colors.orange,
          unSelectedColor: Colors.orange.withOpacity(0.2),
          items:items,
          currentIndex:index,
          onTap: function,
        ),
      ),
    );
  
   }
 }