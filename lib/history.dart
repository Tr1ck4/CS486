import 'package:flutter/material.dart';
import 'lister.dart';

class HistoryPage extends StatefulWidget{
  late Client client;
  HistoryPage({super.key,required this.client});
  @override
  State<HistoryPage> createState()=>_HistoryPage();
}
class _HistoryPage extends State<HistoryPage> with TickerProviderStateMixin{
  int num= 0  ;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    for(var i in widget.client.list_cart){
      if(i.isDone == false){
        num++;
        print(i.list_contains);
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('My Order',style: TextStyle(color: Colors.black),),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text('On Going',style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text('History',style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:[
          ListView.builder(
            itemBuilder: (context, index) {
              if(widget.client.list_cart.length !=0) {
                if(widget.client.list_cart[index].isDone == false){
                  for(var j in widget.client.list_cart[index].list_contains){
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(j.drink.name as String),
                              Text('${j.drink.price}'),
                            ],
                          ),
                          Text(j.drink.name as String),
                          Text(widget.client.address),
                        ],
                      ),
                    );
                  }
                }
              }
            },
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              if(widget.client.list_cart.length !=0) {
                if(widget.client.list_cart[index].isDone == true){
                  for(var j in widget.client.list_cart[index].list_contains){
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(j.drink.name as String),
                              Text('${j.drink.price}'),
                            ],
                          ),
                          Text(j.drink.name as String),
                          Text(widget.client.address),
                        ],
                      ),
                    );
                  }
                }
              }
            },
          )
        ],
      ),
    );
  }
}