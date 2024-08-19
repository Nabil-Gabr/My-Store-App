import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  Function(String)? onChanged;
  String? labelText;
  TextInputType? inputType;
  final bool obscureText;
  final Color enabledColor;
  final Color focusedColor; 


   CustomTextField({
    super.key , 
    this.labelText , 
    this.onChanged,
    this.inputType, 
    required this.obscureText,
    required this.enabledColor, 
    required this.focusedColor
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField( 
              obscureText: obscureText,
              keyboardType: inputType,
              // validator: (data) {
              //   if (data!.isEmpty) {
              //     return 'field is required';
              //   }
              // },
              onChanged: onChanged,
              decoration: InputDecoration(
                // fillColor: Colors.amber,
                // filled: false,
                labelText: labelText,
                labelStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18) ,
        
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:  BorderSide(color: enabledColor,),
                ),
                
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:  BorderSide(color:  focusedColor,width: 1.4),
                )
              ),
            );
  }
}