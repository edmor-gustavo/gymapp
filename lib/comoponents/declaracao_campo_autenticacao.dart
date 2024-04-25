import 'package:flutter/material.dart';

import '../_comum/_minhas_cores.dart';


InputDecoration getAutenticationInputDecoration(String label, {Icon? icon}){
  return InputDecoration(
    icon: icon,
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(
          color: Colors.black, width: 2
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:BorderRadius.circular(64),
      borderSide:const BorderSide(
          color:MinhasCores.azulEscuro,
          width: 4
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius:BorderRadius.circular(64),
      borderSide:const BorderSide(
          color: Colors.red,
          width: 4
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius:BorderRadius.circular(64),
      borderSide:const BorderSide(
          color: Colors.red,
          width: 4
      ),
    ),
  );
}