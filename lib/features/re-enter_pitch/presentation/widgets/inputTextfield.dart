import 'package:flutter/material.dart';

class InputTextfield extends StatelessWidget {
  const InputTextfield({super.key,
    required this.onchabged,
    required this.textEditingController,
    this.validator});

  final Function(String) onchabged;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(  
      height: size.height*0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:Color.fromRGBO(223, 175, 255, 1), width: 2),
      ),
      child:TextFormField(
        style: TextStyle(
          fontSize: size.width*0.05
        ),
        validator: validator,
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged:onchabged,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: size.width*0.04
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                        ),
      )
    );
  }
}