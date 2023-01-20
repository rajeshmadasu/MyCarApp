import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mycarapp/widgets/horizontal_progress_bar.dart';

import 'models/vehicle_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCarApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Car App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<VehicleConfigList> listVehicleConfig = [
    VehicleConfigList(
        icon: 'assets/images/car_icon_grey.png',
        title: "Vehicle Finder",
        description: "Check your vehicle current location"),
    VehicleConfigList(
        icon: 'assets/images/camera_icon.png',
        title: "Remote Cameras",
        description: "Remote 3D under Remote Inside View "),
  ];
//  List<String> icons = [
//     "assets/images/car_icon_grey.png",
//     "assets/images/camera_icon.png",
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: normalAppBar(),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(alignment: Alignment.topLeft, children: <Widget>[
              Image.network(
                  'https://english.cdn.zeenews.com/sites/default/files/styles/zm_700x400/public/2022/08/22/1080790-fast-charging.jpg',
                  color: const Color.fromARGB(124, 241, 240, 240),
                  colorBlendMode: BlendMode.multiply),
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 0, left: 20, right: 0),
                width: 100,
                height: 20,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.white30),
                alignment: Alignment.center,
                child: const Text(
                  "Check Status",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ]),
          ),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(8),
                    child: const Text(
                      'Loading vehicle status...',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  rectShapeContainer(),
                  rectShapeContainerWithImages(),
                ],
              )),
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: listVehicleConfig.map((vehicleConfig) {
                        return box(vehicleConfig.icon, vehicleConfig.title,
                            vehicleConfig.description, Colors.grey.shade300);
                      }).toList(),
                    ))),
          )
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
      ,
      bottomNavigationBar:
          BottomNavigationBar(selectedItemColor: Colors.amber[800], items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            label: "Track"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }

  Widget box(
      String icon, String title, String description, Color backgroundcolor) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        width: 180,
        height: 160,
        color: backgroundcolor,
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icon,
                width: 48,
                height: 48,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ],
        ));
  }

  SliverAppBar getSilverAppBar(Widget widget) {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: Colors.transparent,
      pinned: true,
      floating: false,
      snap: false,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(8.0),
            title: Text(
              "",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  AppBar normalAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.car_rental,
            color: Colors.black,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.lock_person_sharp, color: Colors.black))
      ],
      title: Center(
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      flexibleSpace: Container(
          decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.amber, Colors.tealAccent, Colors.teal]),
      )),

      backgroundColor: Colors.transparent,
      elevation: 0, // add this line
    );
  }

  Widget generateBluredImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mwezz_electric.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      //I blured the parent container to blur background image, you can get rid of this part
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          //you can change opacity with color here(I used black) for background.
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget rectShapeContainerWithImages() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          //you can get rid of below line also
          borderRadius: BorderRadius.circular(10.0),
          //below line is for rectangular shape
          shape: BoxShape.rectangle,
          //you can change opacity with color here(I used black) for rect
          color: Colors.grey.withOpacity(0.2),
          //I added some shadow, but you can remove boxShadow also.
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.white30,
              blurRadius: 5.0,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              alignment: Alignment.center,
              'assets/images/unlock.png',
              width: 32,
              height: 32,
            ),
            Image.asset(
              alignment: Alignment.center,
              'assets/images/lock.png',
              width: 32,
              height: 32,
            ),
            Image.asset(
              alignment: Alignment.center,
              'assets/images/head_light.png',
              width: 36,
              height: 36,
            ),
            Image.asset(
              alignment: Alignment.center,
              'assets/images/horn.png',
              width: 32,
              height: 32,
            ),
            Image.asset(
              alignment: Alignment.center,
              'assets/images/fan.png',
              width: 32,
              height: 32,
            ),
          ],
        ));
  }

  Widget rectShapeContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        //you can get rid of below line also
        borderRadius: BorderRadius.circular(10.0),
        //below line is for rectangular shape
        shape: BoxShape.rectangle,
        //you can change opacity with color here(I used black) for rect
        color: Colors.grey.withOpacity(0.2),
        //I added some shadow, but you can remove boxShadow also.
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.white30,
            blurRadius: 5.0,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          const LinearProgressIndicator(
            minHeight: 4,
            color: Colors.cyan,
            backgroundColor: Colors.grey,
            value: 98 / 100,
            semanticsLabel: 'Linear progress indicator',
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/charging.png',
                  width: 30,
                  height: 30,
                ),
              ),
              const Expanded(
                  flex: 2,
                  child: Text(
                    'Almost Charged',
                  )),
              const Spacer(), // use Spacer

              const Expanded(
                child: Text(
                  '95%',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Expanded(
                child: Text(
                  '455 Kms',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
