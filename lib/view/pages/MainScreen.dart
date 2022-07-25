import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jacobia/view_model/database/BottomNavBarCubit/BottomNavBarCubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../../view_model/database/BottomNavBarCubit/BottomNavBarState.dart';

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
          type: BottomNavigationBarType.shifting,

          currentIndex: BottomNavBarCubit.get(context).index,
          items: [
            buildBottomNavigationBarItem(
                Icon(FontAwesomeIcons.trophy,color: secondaryColor,), Text('المسابقات',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold),)),
            buildBottomNavigationBarItem(
                Icon(FontAwesomeIcons.accusoft,color: secondaryColor,), Text('اعلانات',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold))),
            buildBottomNavigationBarItem(
                Icon(Icons.settings_outlined,color: secondaryColor,), Text('اعدادات',style: TextStyle(fontSize: 17,color: primaryColor,fontWeight: FontWeight.bold)))
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
