import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PosterComisaria extends StatelessWidget {
  const PosterComisaria({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetMaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * .35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/capturaCentroPolicial.png'),
                          fit: BoxFit.cover)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Colors.black87,
                    // Color.fromARGB(255, 32, 109, 35).withOpacity(.6)
                  ], stops: [
                    0.6,
                    1.0
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
                ),
                Container(
                  width: size.width,
                  height: size.height * .65,
                  // color: Colors.red,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Colors.black54,
                  ], stops: [
                    0.5,
                    1.0
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
                ),
              ],
            ),
            Positioned(
                top: size.height * .27,
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.80),
                            border: Border.all(
                                color: Color.fromARGB(255, 32, 109, 35),
                                width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        height: 100,
                        width: size.width,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Comisaría Central\nSanta Cruz Tránsito',
                          style: TextStyle(
                              color: Color.fromARGB(255, 32, 109, 35),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.gps_fixed_sharp,
                                color: Color.fromARGB(255, 32, 109, 35),
                                size: 40),
                            label: Text(
                              'Ubicacion',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontSize: 20),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                            ' Av. Banzer, esquina Tercer Anillo Interno, Santa Cruz de la Sierra, Bolivia.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 32, 109, 35),
                                fontSize: 20)),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month,
                                color: Color.fromARGB(255, 32, 109, 35),
                                size: 40),
                            label: Text(
                              'Horario de Atención:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontSize: 20),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(' 8:00 AM - 5:00 PM de lunes a viernes',
                            style: TextStyle(
                                color: Color.fromARGB(255, 32, 109, 35),
                                fontSize: 20)),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.phone_android,
                                color: Color.fromARGB(255, 32, 109, 35),
                                size: 40),
                            label: Text(
                              'Contacto:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontSize: 20),
                            )),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('+591 3 3321122',
                            style: TextStyle(
                                color: Color.fromARGB(255, 32, 109, 35),
                                fontSize: 20)),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.person,
                                color: Color.fromARGB(255, 32, 109, 35),
                                size: 40),
                            label: Text(
                              'Jefe de Policía :',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontSize: 20),
                            )),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Cmdte. Juan Pérez',
                            style: TextStyle(
                                color: Color.fromARGB(255, 32, 109, 35),
                                fontSize: 20)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                        ),
                        padding: EdgeInsets.only(bottom: 15),
                        height: 105,
                        width: size.width,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      width: 6)),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 50,
                                    color: Color.fromARGB(255, 32, 109, 35),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 32, 109, 35),
                                      width: 6)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.gps_fixed_outlined,
                                    size: 50,
                                    color: Color.fromARGB(255, 32, 109, 35),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
