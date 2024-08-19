import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertaScreen extends StatefulWidget {
  const AlertaScreen({super.key});

  @override
  State<AlertaScreen> createState() => _AlertaScreenState();
}

class _AlertaScreenState extends State<AlertaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 150,
            width: 150,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/SegundoFondo.jpg"),
                            fit: BoxFit.cover),
                        border: Border.all(color: Colors.green, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white.withOpacity(.75),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ingrese la Clave',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 300,
                          height: 80,
                          child: Divider(
                            color: Colors.green,
                            thickness: 3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/primerfondo.jpg"),
                    fit: BoxFit.cover)),
            child: Text('Presionar'),
          ),
        ),
      ),
    );
  }

  void funcionAyuda() {}
}
