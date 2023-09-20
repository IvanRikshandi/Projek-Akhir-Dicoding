import 'package:aplikasi_pa1_dicoding/detail_screen.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:aplikasi_pa1_dicoding/models/lirik_lagu.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: const Color(0xff0C0C0C),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode(context);
          } else {
            return _landscapeMode(context);
          }
        },
      ),
    );
  }

  SafeArea _landscapeMode(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/das.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StreamBuilder(
                              stream: Stream.periodic(
                                const Duration(seconds: 0),
                              ),
                              builder: ((context, snapshot) {
                                return Text(
                                  DateFormat('HH:mm').format(DateTime.now()),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lirikLaguList.length,
                    itemBuilder: (context, index) {
                      final LirikLaguModels liriks = lirikLaguList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              liriks: liriks,
                            );
                          }));
                        },
                        child: Card(
                            shadowColor: Colors.white,
                            color: const Color(0xDD181818),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      liriks.imgUrls,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          liriks.nama,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          liriks.band,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Pencipta Lagu : ${liriks.pencipta}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SafeArea _portraitMode(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/das.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StreamBuilder(
                              stream: Stream.periodic(
                                const Duration(seconds: 0),
                              ),
                              builder: ((context, snapshot) {
                                return Text(
                                  DateFormat('HH:mm').format(DateTime.now()),
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lirikLaguList.length,
                    itemBuilder: (context, index) {
                      final LirikLaguModels liriks = lirikLaguList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              liriks: liriks,
                            );
                          }));
                        },
                        child: Card(
                            shadowColor: Colors.white,
                            color: const Color(0xDD181818),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      liriks.imgUrls,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    liriks.nama,
                                    maxLines: 3,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
