import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/model/response/modelo/modelo_response/content.dart';
import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/widget/home_page/card_coche_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListCocheWidget extends StatefulWidget {
  final int size;
  final int number; 
  final bool empty;
  final bool last;
  const ListCocheWidget({super.key, required this.size, required this.number, required this.empty, required this.last});

  @override
  State<ListCocheWidget> createState() => _ListCocheWidgetState();
}

class _ListCocheWidgetState extends State<ListCocheWidget> {

  // static const _pageSize = 20;

  final PagingController<int, Content> _pagingController =
      PagingController(firstPageKey: 0);

    late ListVehiculosResponse vehiculosResponse;
   late VehiculoRepository vehiculoRepository;

   late VehiculoBloc vehiculoBloc;

    @override
  void initState() {
    vehiculoRepository = VehiculoRepositoryImpl();
    vehiculoBloc = VehiculoBloc(vehiculoRepository)..add(GetVehiculoEvent(widget.number, widget.size, widget.empty, widget.last));
      _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await vehiculoRepository.listVehiculos(pageKey, widget.size, widget.empty, widget.last);
      final isLastPage = newItems.content!.isEmpty || !newItems.last!;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.content!.cast<Content>());
      } else {
        final nextPageKey = pageKey + 1;
      _pagingController.appendPage(newItems.content!.cast<Content>(), nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    vehiculoBloc.close();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return BlocProvider.value(
  //     value: vehiculoBloc,
  //     child: Scaffold(
  //       body: BlocBuilder<VehiculoBloc, VehiculoState>(
  //       bloc: vehiculoBloc,
  //       builder: (context, state) {
  //         if (state is GetVehiculoError) {
  //           return Column(
  //             children: [
  //               Text(state.errorMessage),
  //             ],
  //           );
  //         } else if (state is GetVehiculoSuccess) {
  //           return SizedBox(
  //               child: ListView.builder(
  //                   itemCount: state.vehiculosResponse.content!.length,
  //                   itemBuilder: (context, index) {
  //                     final vehiculo = state.vehiculosResponse;
  //                     return CardCocheWidget(
  //                         vehiculosResponse: vehiculo, index: index);
  //                   }));
  //         } else if (state is GetModelosVehiculosSuccess) {
  //           return SizedBox(
  //               child: ListView.builder(
  //                   itemCount: state.vehiculosModelsResponse.content!.length,
  //                   itemBuilder: (context, index) {
  //                     final vehiculo = state.vehiculosModelsResponse;
  //                     return CardCocheWidget(
  //                         vehiculosResponse: vehiculo, index: index);
  //                   }));
  //         }
  //         return const Center(child: CircularProgressIndicator());
  //       })
  // ),
  // );
  // }
  Widget build(BuildContext context) {
  return BlocProvider.value(
    value: vehiculoBloc,
    child: Scaffold(
      body: BlocBuilder<VehiculoBloc, VehiculoState>(
        bloc: vehiculoBloc,
        builder: (context, state) {
          if (state is GetVehiculoError) {
            return Column(
              children: [
                Text(state.errorMessage),
              ],
            );
          } else if (state is GetVehiculoSuccess) {
            return PagedListView<int, Content>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Content>(
                itemBuilder: (context, content, index) {
                  return CardCocheWidget(
                    vehiculosResponse: content,
                    index: index,
                  );
                },
              ),
            );
          } else if (state is GetModelosVehiculosSuccess) {
            return PagedListView<int, Content>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Content>(
                itemBuilder: (context, vehiculo, index) {
                  return CardCocheWidget(
                    vehiculosResponse: vehiculo,
                    index: index,
                  );
                },
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ),
  );
}

}