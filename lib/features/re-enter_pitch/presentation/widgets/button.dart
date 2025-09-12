import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReEnterButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                height: size.height*0.075,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(153, 54, 219, 1),
                  
                ) ,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Edit",
                    
                    style: GoogleFonts.raleway(fontSize: size.width*0.07,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(247, 247, 247, 1)
                    ),
                    ),
                    SizedBox(width: size.width*0.04,),
                    Icon(Icons.edit,
                    color:Color.fromRGBO(247, 247, 247, 1) ,
                    size: size.width*0.08,
                    )
                  ],
                ),
              );
  }

}