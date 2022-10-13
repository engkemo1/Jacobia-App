import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacobia/constants.dart';
import 'package:jacobia/view/components/component.dart';
import '../../Edit Information.dart';
import '../../view_model/AuthGetX/AuthController.dart';
import '../../view_model/database/local/cache_helper.dart';

class ProfileView extends StatelessWidget {
  var controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: newVv
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              CacheHelper.get(key: 'imageUrl')==null?
              Container(
                height: 150,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/icons/logo.png',
                  ),
                ),
              ): Container(
                height: 150,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    CacheHelper.get(key: 'imageUrl'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 10),
                child: Text(
                  CacheHelper.get(key: 'name') == null
                      ? ''
                      : CacheHelper.get(key: 'name'),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                CacheHelper.get(key: 'email') == null
                    ? ''
                    : CacheHelper.get(key: 'email'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.black54,

               ),
               margin: EdgeInsets.symmetric(horizontal: 15),
               height: MediaQuery.of(context).size.height*0.4,
               child: Column(
                 children: [
                   SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                 ListTile(
                   trailing: Text(
                     'الملف الشخصي',
                     style: TextStyle(fontSize: 19,color: Colors.white),
                   ),
                   leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
                   onTap: () {
                     navigatorScreen(context, EditInfo());
                   },
                 ),
                 const ListTile(
                   trailing: Text(
                     'اللغة',
                     style: TextStyle(fontSize: 19,color: Colors.white),
                   ),
                   leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
                 ),
                 ListTile(
                   trailing: Text(
                     'تسجيل الخروج',
                     style: TextStyle(fontSize: 19,color: Colors.white),
                   ),
                   onTap: () {
                     controller.signout();
                   },
                   leading: Icon(Icons.logout,color: Colors.red,),
                 ),
                 const Spacer(),
                 const SizedBox(
                   height: 16,
                 )
               ],),
             )
            ],
          ),
        ),
      ),
    );
  }
}
