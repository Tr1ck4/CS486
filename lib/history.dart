import 'package:flutter/material.dart';
import 'home.dart';
import 'lister.dart';
import 'main.dart';

class HistoryPage extends StatefulWidget{
  const HistoryPage({super.key});
  @override
  State<HistoryPage> createState()=>_HistoryPage();
}
class _HistoryPage extends State<HistoryPage> with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  void refresh(){
    setState(() {
    });
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
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: list_client.length,
              itemBuilder: (context, index){
                List<Widget> ls = [];
                if(index==0){
                  for (var f in list_client){
                    print(list_client.length);
                    for(var i in f.list_cart){
                      if(i.isDone == false){
                        for(var j in i.list_contains){
                          print('${f.name} ${j.drink.name}');
                          ls.add(
                              InkWell(
                                  onTap: (){
                                    i.isDone = true;
                                    refresh();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(i.time ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons.coffee),
                                                  Padding(padding: const EdgeInsets.symmetric(horizontal: 12),child: Text(j.drink.name as String,style: const TextStyle(fontWeight: FontWeight.bold)),)

                                                ],
                                            ),
                                            Text('\$${j.drink.calculateTotal(((j.type%100 - j.type%10)/10).round(),((j.type - j.type%1000-j.type%100 - j.type%10)/1000).round())}',style: const TextStyle(fontSize: 25),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.map_outlined),
                                            Padding(padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),child: Text(f.address.length>10?'${f.address.substring(0,10)}...':f.address))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              )
                          );
                        }
                      }
                    }
                  }
                  return ls.isEmpty ? null : Column(children: ls,);
                }

              }
          ),
          ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: list_client.length,
                  itemBuilder: (context, index){
                    if(index==0){
                      List<Widget> ls = [];
                      for(var f in list_client){
                        print(f.name);
                        for(var i in f.list_cart){
                          if(i.isDone == true){
                            for(var j in i.list_contains){
                              print(j.drink.name);
                              ls.add(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(i.time ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                const Icon(Icons.coffee),
                                                Padding(padding: const EdgeInsets.symmetric(horizontal: 12),child: Text(j.drink.name as String,style: const TextStyle(fontWeight: FontWeight.bold)),)

                                              ],
                                            ),
                                            Text('\$${j.drink.calculateTotal(((j.type%100 - j.type%10)/10).round(),((j.type - j.type%1000-j.type%100 - j.type%10)/1000).round())}',style: const TextStyle(fontSize: 25),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.map_outlined),
                                            Padding(padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),child: Text(f.address.length>10?'${f.address.substring(0,10)}...':f.address))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              );
                            }
                          }
                        }
                      }
                      return ls.isEmpty ? null : Column(children: ls,);
                    }
                  }
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
                Navigator.pop(context);
              }, icon: const Icon(Icons.card_giftcard)),
              IconButton(onPressed: (){
              }, icon: const Icon(Icons.bookmark_border)),
            ],
          )
      ),
    );
  }
}