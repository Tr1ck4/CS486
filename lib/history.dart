import 'package:flutter/material.dart';
import 'lister.dart';
import 'main.dart';

class HistoryPage extends StatefulWidget{
  HistoryPage({super.key});
  @override
  State<HistoryPage> createState()=>_HistoryPage();
}
class _HistoryPage extends State<HistoryPage> with TickerProviderStateMixin{
  late TabController _tabController;
  int tr = 0;
  int f = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    for(var i in list_client){
      for (var  j in i.list_cart){
        if(j.isDone ==false) f++;
      }
    }
    for(var i in list_client){
      for (var  j in i.list_cart){
        if(j.isDone ==true) tr++;
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
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
          },
        ),
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
        children: <Widget>[
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: f,
              itemBuilder: (context, index){
                for(var i in  list_client){
                  for (var j in i.list_cart){
                    if(j.isDone == false){
                      for(var f in j.list_contains){
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(j.time ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.coffee),
                                        Text(f.drink.name as String,style: const TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Text('\$${f.drink.calculateTotal(((f.type%100 - f.type%10)/10).round(),((f.type - f.type%1000-f.type%100 - f.type%10)/1000).round())}',style: const TextStyle(fontSize: 25),),
                                ],
                              ),
                              SizedBox(
                                width: 85,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.map_outlined),
                                    Text(i.address,style: const TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }
                }
              },
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: f,
              itemBuilder: (context, index){
                for(var i in  list_client){
                  for (var j in i.list_cart){
                    if(j.isDone == true){
                      for(var f in j.list_contains){
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(j.time ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.coffee),
                                        Text(f.drink.name as String,style: const TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Text('\$${f.drink.calculateTotal(((f.type%100 - f.type%10)/10).round(),((f.type - f.type%1000-f.type%100 - f.type%10)/1000).round())}',style: const TextStyle(fontSize: 25),),
                                ],
                              ),
                              SizedBox(
                                width: 85,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.map_outlined),
                                    Text(i.address,style: const TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }
                }
              },
            ),
          ),

        ]
      ),
    );
  }
}