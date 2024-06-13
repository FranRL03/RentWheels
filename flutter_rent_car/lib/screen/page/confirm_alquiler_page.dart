import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/alquiler/alquiler_bloc.dart';
import 'package:flutter_rent_car/bloc/user_details/user_bloc.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository_impl.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/screen/widget/user/formulario_ingresar.dart';
import 'package:u_credit_card/u_credit_card.dart';

class ConfirmAlquilerPage extends StatefulWidget {
  const ConfirmAlquilerPage({super.key});

  @override
  State<ConfirmAlquilerPage> createState() => _ConfirmAlquilerPageState();
}

class _ConfirmAlquilerPageState extends State<ConfirmAlquilerPage> {
  late AlquilerRepository alquilerRepository;
  late AlquilerBloc alquilerBloc;
  late UserRepository userRepository;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    alquilerRepository = AlquilerRepositoryImpl();
    alquilerBloc = AlquilerBloc(alquilerRepository)
      ..add(GetPriceAlquilerClienteEvent());

    userRepository = UserRepositoryImpl();
    userBloc = UserBloc(userRepository)..add(GetUserDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            CreditCardUi(
              cardHolderFullName: 'John Doe',
              cardNumber:
                  '${(Random().nextInt(88888888) + 11111111)} ${(Random().nextInt(88888888) + 11111111)}',
              validFrom: '${Random().nextInt(11) + 1}/23',
              validThru: '${Random().nextInt(11) + 1}/28',
              topLeftColor: Colors.blue,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              cardType: CardType.credit,
              cardProviderLogo: const FlutterLogo(),
              cardProviderLogoPosition: CardProviderLogoPosition.right,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormularioIngresar()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 24), // Icono de añadir
                    SizedBox(width: 8), // Espacio entre el icono y el texto
                    Text('Añadir Dinero'), // Texto del botón
                  ],
                ),
              ),
            ),
            dineroWidget(),
            const SizedBox(height: 30),
            Expanded(
              child: listPrice(),
            ),
          ],
        ),
      ),
    );
  }

  Widget listPrice() {
    return BlocProvider.value(
      value: alquilerBloc,
      child: BlocBuilder<AlquilerBloc, AlquilerState>(
        builder: (context, state) {
          if (state is GetPriceAlquilerClienteError) {
            return const Text('Error al obtener precios');
          } else if (state is GetPriceAlquilerClienteSuccess) {
            return ListView.builder(
              itemCount: state.listPriceRentClient.length,
              itemBuilder: (context, index) {
                final price = state.listPriceRentClient[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Fecha de creación',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            '${state.listPriceRentClient[index].fechaCreacion}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Precio',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            ' ${price.precio} €',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Divider(height: 30, color: Colors.black),
                    ],
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget dineroWidget() {
    return BlocProvider.value(
      value: userBloc,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is DoUserError) {
            return Column(
              children: [
                Text(state.errorMessage),
              ],
            );
          } else if (state is DoUserSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Text(
                      'Dinero Ingresado:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${state.userDetails.cash} €',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
