import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacobia/view/components/component.dart';
import '../../Edit Information.dart';
import '../../view_model/AuthGetX/AuthController.dart';
class ProfileView extends StatelessWidget {


  var controller = AuthController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
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
                'assets/images/man.png',


              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 50.0),
            child: Text(
              "Kamal MAgdy",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           ListTile(

            trailing: Text('الملف الشخصي',style: TextStyle(fontSize: 19),),
            leading: Icon(Icons.arrow_back_ios),
            onTap: (){
navigatorScreen(context, EditInfo());
            },
          ),
          const ListTile(
           trailing : Text('اللغه',style: TextStyle(fontSize: 19),),
            leading: Icon(Icons.arrow_back_ios),
          ),

           ListTile(
               trailing : Text('تسجيل الخروج',style: TextStyle(fontSize: 19),),
                onTap: (){
controller.signout();
                },
                leading: Icon(Icons.arrow_back_ios),

           ),
          const Spacer(),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}