import 'package:flutter/material.dart';
import 'package:submission/data/data_list.dart';
import 'package:submission/widget/my_card.dart';

class ListPendapatan extends StatelessWidget {
  const ListPendapatan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  const Icon(Icons.arrow_back),
          onPressed: () { Navigator.pop(context); },
        ),
        centerTitle: true,
        title: const Text(
          "List Pendapatan",
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40)
            )
        ),
      ),
      body: LayoutBuilder(
        builder:(BuildContext context, BoxConstraints constrains){
          if( constrains.maxWidth <=700){
            return  const MobileViewList();
          }else if (constrains.maxWidth <=1100){
            return const WebViewList(gridCount: 3,);
          }else{
            return const WebViewList(gridCount: 5,);
          }
        },
      ) ,
    );
  }
}

class MobileViewList extends StatelessWidget {
  const MobileViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listPendapatan.length,
        itemBuilder: (context,index){
          final Pendapatan pendapatan = listPendapatan[index];
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
            child:MyCard(text: pendapatan.bulan, number: pendapatan.nominal) ,
          );
        } );
  }
}

class WebViewList extends StatelessWidget {
  final int gridCount;
  const WebViewList({Key? key,required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
      child: GridView.count(
          crossAxisCount: gridCount,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: listPendapatan.map((e) {
            return  MyCard(text: e.bulan, number: e.nominal);

          }).toList(),
      ),
    );
  }
}


