import 'package:flutter/material.dart';



class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
        required this.label,
        this.controller,
        this.icondata,
        required this.hint,
        this.widget,
        required this.iconOrdrop,
        required this.isEnabled, required this.texth,  this.textInputType, this.code=false})
      : super(key: key);
  final String label;
  final TextEditingController? controller;
  final IconData? icondata;
  final String hint;
  final String iconOrdrop;
  final Widget? widget;
  final bool isEnabled;
  final double texth;
  final bool code;

  final TextInputType? textInputType;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              color:  Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: widget.texth),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: widget.textInputType,
          readOnly: !widget.isEnabled,
          controller: widget.controller,
          validator: (value) {
            if (widget.code){
              value.toString().length!=15;
              return 'Please Enter 15 number';

            }
            if (value.toString().isEmpty) {
              return 'Please Enter ${widget.label}';
            }
          },
          cursorColor:  Colors.white,
          style: TextStyle(color:  Colors.white,fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            suffixIcon: widget.iconOrdrop == 'icon'
                ? Icon(
              widget.icondata,
              color: Colors.grey,
            )
                : Container(margin: EdgeInsets.only(right: 10), child: widget.widget),
            hintText: widget.hint,
            hintStyle:
            TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color:  Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color:  Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
