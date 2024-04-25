import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



mostrarSnackBar({
  required BuildContext context,
  required texto,
  bool isErro=true}){
  SnackBar snackBar= SnackBar(
    content: Text(texto),
    backgroundColor: (isErro)? Colors.red: Colors.green,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(16)
        )
    ),
    duration: const Duration(seconds: 4),
    action: SnackBarAction(
      label: "ok",
      textColor: Colors.white,
      onPressed:(){
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } ,
    ),
    showCloseIcon: true,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}