import 'package:flutter/material.dart';
class Inputfield extends StatelessWidget {
  const Inputfield({Key? key, required this.textEditingController,
    required this.onchabged, required this.height}) : super(key: key);
  final TextEditingController textEditingController;
  final Function(String) onchabged;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: double.infinity,
                      height:height,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(247, 235, 255, 1),
                      ),
                      child: TextField(
                        
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