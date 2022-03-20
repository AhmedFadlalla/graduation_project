
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/shared/styles/icon_broken.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required var function,
  required String text,
  bool isUpperCase = true,
  double radius = 10.0,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
Widget defaultTextButton({
  required String text,
  required var pressedFunction
})=>TextButton(
    onPressed: pressedFunction,
    child: Text(text.toUpperCase()));
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  var prefixIconTapFunction,
  required var validator,
  required String label,
  required IconData prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      style: TextStyle(
        color: Colors.black
      ),
      decoration: InputDecoration(
        labelText: label,

        prefixIcon: InkWell(
          onTap: prefixIconTapFunction,
          child: Icon(
            prefixIcon,
          ),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: sufixPressed,
                icon: Icon(
                  suffixIcon,
                ))
            : null,

          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.red,

              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.red,

              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: Colors.white,

              )
          )
      ),
    );



Widget defultLoginField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String labelText,
  required IconData preIcon,
  required var tabFunction,
  required var validation,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: '$labelText',
        labelStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,

        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),

        ),
        prefixIcon: Icon(
          preIcon,
        ),
      ),
      keyboardType: inputType,
      controller: controller,
      onTap: tabFunction,
      validator: validation,
    );

Widget materialBottomLogin({
  required var pressFunction,
  required String bottomText,
  Color backgroundColor = Colors.white24,
  double radius=20.0,
  double width=double.infinity,
  Color textColor=Colors.black,

}) {
  return Container(
    width: width,
    child: MaterialButton(
      onPressed: pressFunction,
      child: Text(
        '$bottomText',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color:textColor ),
      ),


    ),

   decoration: BoxDecoration(

     borderRadius: BorderRadius.circular(radius),
     color: backgroundColor,



   ),

  );
}
Widget myDivider()=>Padding(
  padding: EdgeInsetsDirectional.only(start: 20.0),
  child:Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ) ,);


void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) =>widget

    )
);



void navigateAndFinish
    (context,widget)=>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>widget),
            (Route<dynamic> route) => false);

void showToast({
  required String text,
  required ToastStates state
 })=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
return color;
}

Widget defaultAppBar(
{
 required BuildContext context,
  var title,
  var actions
}
    )=>AppBar(
  leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:Icon(IconBroken.Arrow___Left) ),
  title: Text('$title'),
  actions: [actions],
);


Widget BuildDropBottom(
    {required dropdownButtonTitle,
      required value,
      required function,
      required items}) =>
    Center(
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)),
        child: DropdownButton(
//elevation: 0,
            hint: Text(
              dropdownButtonTitle,
              style: TextStyle(
                fontSize: 18.0,
//fontWeight: FontWeight.bold,
              ),
            ),
            dropdownColor: Colors.white54.withOpacity(0.6),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
//textDirection: TextDirection.rtl, عايز اعمل ده
            ),
            value: value,
            onChanged: function,
            items: items),
      ),
    );




