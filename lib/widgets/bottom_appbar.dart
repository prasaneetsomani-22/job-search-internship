import 'package:flutter/material.dart';
class BottomAppbar extends StatefulWidget {
  final int tabno;
  final Function(int) onPressed;
  BottomAppbar({this.tabno,this.onPressed});
  @override
  BottomAppbarState createState() => BottomAppbarState();
}

class BottomAppbarState extends State<BottomAppbar> {
  int activetab;
  @override
  Widget build(BuildContext context) {
    activetab = widget.tabno;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        boxShadow: [BoxShadow(
          blurRadius: 32,
          spreadRadius: 1.0,
          color: Colors.black.withOpacity(0.2)
        )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Bottomtabs(icon:Icons.home,isselectedtab: activetab==0,onPressed: (){widget.onPressed(0);},),
          Bottomtabs(icon:Icons.add_box,isselectedtab: activetab==1,onPressed: (){widget.onPressed(1);}),
          Bottomtabs(icon: Icons.person,isselectedtab: activetab==2,onPressed: (){widget.onPressed(2);})
        ],
      ),
    );
  }
}
class Bottomtabs extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final bool isselectedtab;
  Bottomtabs({this.icon,this.isselectedtab,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 3,color: isselectedtab?Colors.black:Colors.transparent))
        ),
        child: Icon(icon,size: 35,color: isselectedtab?Colors.black:Colors.grey,),
      ),
    );
  }
}
