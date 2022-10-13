import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jacobia/view_model/CodeGetx.dart';
import '../../constants.dart';
import '../../model/card/card.dart';
import '../../view_model/database/local/cache_helper.dart';
import '../components/ Widget/DropDownWidget.dart';
import '../components/ Widget/card.dart';
import '../components/animation.dart';

class Wallet extends GetView<CodesGetX> {
  final _formKey = GlobalKey<FormState>();

  var user = FirebaseFirestore.instance
      .collection('users')
      .doc(CacheHelper.get(key: 'uid'));

  TextEditingController typeCoins=TextEditingController();
  String typeCoin = 'None';
  List<String> coinsList = ['redCoins', 'greenCoins', 'yellowCoins',];
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    var code = Get.put(CodesGetX());

    return Scaffold(
      body: Container(
        height: he,
        width: we,
        decoration: BoxDecoration(gradient: newVv),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // #signup_text
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CacheHelper.get(key: 'imageUrl')==null?
                            CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/icons/logo.png'),
                              radius: 30,
                            ):CircleAvatar(
                              backgroundImage:
                              NetworkImage(CacheHelper.get(key: 'imageUrl')),
                              radius: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Builder(builder: (context) {
                              return Column(
                                children: [
                                  Text(
                                    CacheHelper.get(key: 'name') ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        decoration: TextDecoration.none),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              );
                            }),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white70,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                child: Stack(
                                  children: [
                                    const Icon(
                                      Icons.notifications,
                                      color: primaryColor,
                                      size: 30,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(top: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffc32c37),
                                            border: Border.all(
                                                color: Colors.white, width: 1)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 8,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: GetBuilder(
                    init: code,
                    builder: (_) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 80,
                        ),
                        // Icons custom button //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              height: he * 0.05,
                            ),
                            iconswidget(
                                title: "ايداع",
                                color: const Color(0xFF411C2E),
                                delayanimation: 1.7,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.black45,
                                            titlePadding: EdgeInsets.all(0),
                                            title: Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(Icons.close)),
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: Container(
                                              height: 250,
                                              width: 220,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text(
                                                    "قم بادخال كود البطاقة للحصول على رصيدك من العملات",
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    width: 247.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Colors.white,
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                          controller.codeController,
                                                      obscureText: true,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(15),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        hintText: 'xxxxxxx',
                                                            helperStyle: TextStyle(color: Colors.white)
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      controller.checkCode(
                                                          context,
                                                      );
                                                    },
                                                    child: Container(
                                                        width: 200.0,
                                                        height: 35.0,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            color:
                                                                Colors.greenAccent),
                                                        child: const Center(
                                                          child: Text(
                                                            "Submit",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 14,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child:  Image.asset('assets/icons/deposit.jpeg'),

                                )),
                            SizedBox(
                              width: we * 0.03,
                            ),
                            iconswidget(
                                title: "سحب",
                                color: const Color(0xFF411C2E),
                                delayanimation: 1.9,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            titlePadding: EdgeInsets.all(0),
                                            backgroundColor: Colors.black45,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: SizedBox(
                                              height: 350,
                                              child: Form(
                                          key: _formKey,
                                          child: Column
                                          (
                                              mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                          SizedBox(height: 10,),
                                          InputField(

                                          isEnabled: false,
                                          hint: '${typeCoin.toString()}',
                                          controller: typeCoins,

                                          label: 'Select Coins',
                                          iconOrdrop: 'drop',
                                          widget: DropdownButton(
                                          items: coinsList
                                                .map<DropdownMenuItem<String>>(
                                          (value) =>
                                          DropdownMenuItem<String>(
                                          value: value.toString(),
                                          child: Text(
                                          '$value',
                                          style: TextStyle(
                                          color:
                                          Colors.black),
                                          )))
                                                .toList(),
                                          icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                          ),
                                          iconSize: 20,
                                          underline: Container(
                                          height: 0,
                                          ),
                                          onChanged: (String? newValue) {
                                          typeCoins.text = newValue!;
                                          controller.typeCoins= newValue;

                                          },
                                          ),
                                          texth: 15,
                                          ),

                                          SizedBox(height: 20,),
                                              InputField(controller: controller.priceController,
                                                  label: 'Price',
                                                  textInputType: TextInputType.number,

                                                  hint: 'Enter Code Price',
                                                  iconOrdrop: 'icon',
                                                  isEnabled: true,
                                                  texth: 15),
                                              SizedBox(height: 20,),

                                              SizedBox(

                                          width: 150, child: ElevatedButton(onPressed: () async{

                                          if (_formKey.currentState!.validate()){
                                           await controller.request();
                                          }

                                                              }, child: Text(
                                          'Save'
                                          ),
                                          style: ElevatedButton.styleFrom(
                                          primary: Colors.greenAccent
                                          ),
                                          ),
                                          )


                                          ],
                                          ),
                                          ),
                                            ));
                                        });
                                  },
                                  child: Image.asset(
                                    'assets/icons/withdaraw.jpeg'
                                  ),
                                )),
                            SizedBox(width: we * 0.03),
                          ],
                        ),
                        SizedBox(
                          height: he * 0.05,
                        ),

                        // histories from wallet  ..  //
                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('users').where('email',isEqualTo: CacheHelper.get(key: 'email')).snapshots(),
                            builder: (context, AsyncSnapshot snapshot){
                          if(snapshot.connectionState==ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator.adaptive(),);
                          }else{
                           var snap=snapshot.data.docs;
                            return                       Column(
                              children: [
                                historywallet(
                                  images: 'assets/icons/dyr.png',
                                  title: "العملة حمراء",
                                  money:snap[0]['redCoins'].toString(),
                                  name: 'عملة سورية',
                                ),
                                SizedBox(
                                  height: he * 0.02,
                                ),
                                historywallet(
                                  images: "assets/icons/lep.png",
                                  title: "العملة الخضراء",
                                  money: snap[0]['greenCoins'].toString(),
                                  name: 'عملة لبنان',
                                ),
                                SizedBox(
                                  height: he * 0.02,
                                ),
                                historywallet(
                                  images: "assets/icons/egp.png",
                                  title: "العملة صفراء",
                                  money: snap[0]['yellowCoins'].toString(),
                                  name: 'عملة مصر',
                                ),
                              ],
                            );

                          }

                        })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class swipercard extends StatelessWidget {
  const swipercard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return FadeAnimation(
      delay: 1.5,
      child: Swiper(
        itemCount: cardinfo.length,
        layout: SwiperLayout.TINDER,
        itemWidth: 400,
        itemHeight: 340,
        itemBuilder: (c, i) {
          return Stack(
            children: <Widget>[
              Column(children: <Widget>[
                SizedBox(height: he * 0.015),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: cardinfo[i].color,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(cardinfo[i].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              SizedBox(
                                width: we * 0.5,
                              ),
                              Image.asset(
                                cardinfo[i].icon,
                                width: we * 0.07,
                                height: he * 0.07,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: he * 0.03,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("••••",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: we * 0.04),
                                const Text("••••",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: we * 0.04),
                                const Text("••••",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: we * 0.04),
                                const Text("7450",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: he * 0.05,
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 200),
                              child: const Text(
                                "Available Balance",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(height: he * 0.01),
                          Row(children: <Widget>[
                            Image.asset(
                              "images/us-dollar.png",
                              width: we * 0.06,
                              height: we * 0.06,
                              color: Colors.white,
                            ),
                            Text(
                              cardinfo[i].money,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: we * 0.45),
                            Image.asset(cardinfo[i].bank,
                                width: we * 0.09,
                                height: we * 0.09,
                                color: Colors.white)
                          ]),
                        ],
                      ),
                    ),
                  ),
                )
              ])
            ],
          );
        },
      ),
    );
  }
}

class historywallet extends StatelessWidget {
  late String images;
  late String title;
  late String dollar;
  late String name;
  late String money;

  historywallet(
      {required this.images,
      required this.title,
      required this.money,
      required this.name});

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return FadeAnimation(
      delay: 2,
      child: Container(
        width: we * 0.9,
        height: he * 0.085,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: const Color(0xFF282A40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              images,
              height: 50,
            ),
            SizedBox(
              width: we * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                SizedBox(
                  height: he * 0.01,
                ),
                Row(
                  children: [
                    Text(name, style: const TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            SizedBox(
              width: we * 0.16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  money,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
