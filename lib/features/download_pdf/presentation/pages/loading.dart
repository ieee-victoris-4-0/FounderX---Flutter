import 'package:flutter/material.dart';
import 'package:founderx/core/presentation/pages/loadingPage.dart';
import 'package:founderx/features/download_pdf/presentation/pages/success.dart';
import '../../../../core/transitions/fade_page.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  _loading()async{
    print("loading");
        await downloadFile("https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf", "file.pdf");
       await Future.delayed(const Duration(seconds: 2), (){
      if(mounted){
      Navigator.of(context).push(FadePageRoute(pageBuilder: (context, animation, secondaryAnimation) => Success()));
      }
    });
  }
  @override
  void initState() {
    _loading();
    super.initState();
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingPage(),
    );
  }
}
  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return Directory('/storage/emulated/0/Download');
    } else {
      return await getApplicationDocumentsDirectory();
    }
  }
Future<void> downloadFile(String url, String fileName) async {
  if(Platform.isAndroid){
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    print("Permission denied");
    return;
  }
  print("Permission granted");
  }
  Directory? downloadsDir = await _getDownloadDirectory();
  print(downloadsDir.path);
  String savePath = "${downloadsDir.path}/$fileName";

  try {
    Dio dio = Dio();
    await dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          print("Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
    print("File saved at $savePath");
  } catch (e) {
    print("Download error: $e");
  }
}