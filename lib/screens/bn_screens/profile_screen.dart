import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           Container(
             padding:const  EdgeInsets.only(top:80, left: 20),
             alignment: AlignmentDirectional.topStart,
             height: 150.h,
             width: double.infinity,
             decoration: BoxDecoration(
                 borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                 color: HexColor('#01221D')),
             child: Text('My Account ' , style:TextStyle(fontSize: 22.sp, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),



           ),
        Expanded(
          child:  GridView(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        // mainAxisExtent: 125,
        childAspectRatio: 114/125
        ),
        children: [
        GestureDetector(
          onTap:(){
            Navigator.pushNamed(context, '/personal_info');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('Personal Info'  , style:TextStyle(fontFamily: 'Poppins' , fontSize: 18.sp, fontWeight: FontWeight.bold)),

          ],),),
        ),
          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, '/contact_request');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
               child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Contact Requests'  , style:TextStyle(fontFamily: 'Poppins' , fontSize: 18.sp, fontWeight: FontWeight.bold)),
                //Icon(Icons)
              ],),),
          ),
          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, '/settings');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Settings'  , style:TextStyle(fontFamily: 'Poppins' , fontSize: 18.sp, fontWeight: FontWeight.bold)),
                //Icon(Icons.fa)
              ],),),
          ),


          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, '/faq');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('FAQ'  , style:TextStyle(fontFamily: 'Poppins' , fontSize: 18.sp, fontWeight: FontWeight.bold)),
                //Icon(Icons.fa)
              ],),),
          ),
    ],
    )
        )

         ],
       ),
    );
  }
}
