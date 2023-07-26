import 'package:flutter/material.dart';
import 'Rewards.dart';
import 'home.dart';
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp(),));
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
          ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: f,
            itemBuilder: (context, index){
              List<Widget> view = [];
              if(index ==0){
                for(var i in list_client){
                  for (var j in i.list_cart){
                    if(j.isDone == false){
                      for(var f in j.list_contains){
                        view.add(
                            Container(
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
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.coffee),
                                            Padding(padding: const EdgeInsets.symmetric(horizontal: 12),child: Text(f.drink.name as String,style: const TextStyle(fontWeight: FontWeight.bold)),)

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
                            )
                        );

                      }
                    }
                  }
                }
              }
              if(view.isEmpty){
                return null;
              }
              else {
                return Column(children: view,);
              }
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.map_outlined),
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.coffee),
                                      Text(i.address,style: const TextStyle(fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  }
                }
              }
              return null;
            },
          ),

        ]
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width/20,
              20,
              MediaQuery.of(context).size.width/20,
              50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(4,8),
              )]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(client: list_client.last),));
              }, icon: const Icon(Icons.home)),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RewardPage(client: list_client.last,cart: list_client.last.list_cart.last ),));
              }, icon: const Icon(Icons.card_giftcard)),
              IconButton(onPressed: (){
              }, icon: const Icon(Icons.bookmark_border)),
            ],
          )
      ),
    );
  }
}