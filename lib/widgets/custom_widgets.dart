import 'package:flutter/material.dart';

navigateTo(context,Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
navigateToAndReplace(context,Widget widget){
  Navigator.pushReplacement(context, 
  MaterialPageRoute(builder: (context)=>widget));

}