import 'package:chatgpt_flutter/Helpers/api_Service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempWidget extends StatefulWidget {
  const TempWidget({super.key});

  @override
  State<TempWidget> createState() => _TempWidgetState();
}

class _TempWidgetState extends State<TempWidget> {
  Future<dynamic> getData() async {
    String image = await ApiService.generateImg("dog on moon");
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Temp",
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<dynamic>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as String;
              return Image.network(data);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
