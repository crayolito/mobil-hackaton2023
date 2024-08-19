import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/login/login_form_bloc.dart';
import 'package:notification/bloc/socket/socket_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormBloc = BlocProvider.of<LoginFormBloc>(context, listen: true);
    final authBloc = BlocProvider.of<AuthBloc>(context, listen: true);
    final socketBloc = BlocProvider.of<SocketBloc>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/perfilImage.jpg'),
                  fit: BoxFit.cover)),
        ),
        SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            // color: Colors.white.withOpacity(.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.75),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontFamily: 'Courier',
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              loginFormBloc
                                  .add(OnNrCiChanged(int.tryParse(value)!));
                            },
                            cursorColor: Color.fromARGB(255, 32, 109, 35),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 32, 109, 35),
                              ),
                              labelText: 'CI', // Texto del marcador
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontSize: 25,
                                  fontWeight:
                                      FontWeight.bold), // Estilo del marcador
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 32, 109, 35)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 32, 109, 35)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          child: TextFormField(
                            onChanged: (value) {
                              loginFormBloc.add(OnPasswordChanged(value));
                            },
                            cursorColor: Color.fromARGB(255, 32, 109, 35),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Color.fromARGB(255, 32, 109, 35),
                              ),
                              labelText: 'Contraseña', // Texto del marcador
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 32, 109, 35),
                                  fontSize: 25,
                                  fontWeight:
                                      FontWeight.bold), // Estilo del marcador
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 32, 109, 35)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 32, 109, 35)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            loginFormBloc.add(OnFormSubmit());

                            authBloc.stream.listen((state) {
                              if (state.authStatus ==
                                  AuthStatus.authenticated) {
                                socketBloc.iniConfig();
                                print('HOOLA');
                                Navigator.pushReplacementNamed(
                                    context, 'categorias');
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0.50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color.fromARGB(255, 32, 109, 35),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              color: Color.fromARGB(255, 32, 109, 35),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
