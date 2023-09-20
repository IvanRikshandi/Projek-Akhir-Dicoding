import 'package:aplikasi_pa1_dicoding/models/lirik_lagu.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final LirikLaguModels liriks;
  const DetailScreen({Key? key, required this.liriks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  liriks.band,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  liriks.nama,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Pencipta :\n${liriks.pencipta}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  liriks.lirik,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
