import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../../view_model/Cubit/BottomNavBarCubit/BottomNavBarCubit.dart';
import '../../view_model/Cubit/BottomNavBarCubit/BottomNavBarState.dart';

  class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BottomNavBarCubit();
      },
      child: BlocConsumer<BottomNavBarCubit,MainState>(listener: (BuildContext context, state) {  }, builder: (BuildContext context, Object? state) { return Scaffold(
        body: BottomNavBarCubit.get(context).screenList[BottomNavBarCubit.get(context).index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          currentIndex: BottomNavBarCubit.get(context).index,
          items: [
            buildBottomNavigationBarItem(
                Icon(FontAwesomeIcons.trophy,color: secondaryColor,), Text('المسابقات',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold),)),
            buildBottomNavigationBarItem(
                Icon(FontAwesomeIcons.accusoft,color: secondaryColor,), Text('النتائج',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold))),
            buildBottomNavigationBarItem(
                Icon(Icons.person,color: secondaryColor,), Text('الملف الشخصي',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold))),
            buildBottomNavigationBarItem(
                Icon(FontAwesomeIcons.wallet,color: secondaryColor,), Text('المحفظه',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold),)),
          ],
          onTap: (index) {
            BottomNavBarCubit.get(context).change(index);
          },
        ),
      ); },)
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem(
  Widget icon,
  Widget activeIcon,
) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.white,
    activeIcon: activeIcon,
    icon: icon,
    label: "",
  );
}
