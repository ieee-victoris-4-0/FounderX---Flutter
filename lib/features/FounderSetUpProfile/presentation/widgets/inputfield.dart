import 'package:flutter/material.dart';
class Inputfield extends StatelessWidget {
  const Inputfield({super.key, required this.textEditingController,
    required this.onchabged, required this.height, this.validator});
  final TextEditingController textEditingController;
  final Function(String) onchabged;
  final double height;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: double.infinity,
                      height:height,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(247, 235, 255, 1),
                      ),
                      child: TextFormField(
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
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
  }
}