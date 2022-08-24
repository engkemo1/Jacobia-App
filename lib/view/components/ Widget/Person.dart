
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/PickImage.dart';


class Person extends StatelessWidget {

  final Color color2;
  final double size;
  final double reduis;
  const Person(
      {

      required this.color2,
      required this.size,
      required this.reduis });
  

  @override
  Widget build(BuildContext context) {
    
    return Center(

      child:Provider.of<GetImage>(context).file !=null?CircleAvatar(radius: 100,backgroundImage: FileImage(Provider.of<GetImage>(context).file!,)): Icon(
        Icons.person,
        color: color2,
        size: size,
      )
    );
  }
}
