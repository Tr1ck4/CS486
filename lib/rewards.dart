import 'package:cinema/redeem.dart';
import 'package:flutter/material.dart';
import 'history.dart';
import 'home.dart';
import 'lister.dart';

class RewardPage extends StatefulWidget{
  late Client client;
  Cart cart;
  RewardPage({super.key,required this.client,required this.cart});
  @override
  State<RewardPage> createState()=>_RewardPage();
}
class _RewardPage extends State<RewardPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/8,
                child: const Center(
                  child: Text('Rewards',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/5.7,
                    margin: const EdgeInsets.fromLTRB(20,0,20,0),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width/8,
                        10,
                        MediaQuery.of(context).size.width/8,
                        0),
                    child: Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Loyalty card',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        Text('4/8'),// Counter of order
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width/8,
                        36,
                        MediaQuery.of(context).size.width/8,
                        0),
                    height: MediaQuery.of(context).size.height/10,
                    width: MediaQuery.of(context).size.width/1.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee)
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/6,
                margin: const EdgeInsets.fromLTRB(20,20,20,0),
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('My Points :',style: TextStyle(fontSize: 20,color: Colors.white),),
                        const SizedBox(height: 5,),
                        Text('${widget.client.points}',style: const TextStyle(fontSize: 20
                            ,color: Colors.white),),
                      ],
                    ),
                    FilledButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RedeemPage(client: widget.client,cart: widget.cart,),));
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueGrey),
                      ),
                      child:const Text('Redeem drinks'),)
                  ],
                ),

              ),
              Container(
                height: 30,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text('History Rewards',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                height: MediaQuery.of(context).size.height/3.6,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    List<Widget> ls = [];
                    if(index<list_client.length){
                      for(var i in list_client[index].list_cart){
                        for(var j in i.list_contains){
                          ls.add(
                              Container(
                                height: 70,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('${j.drink.name}',style: const TextStyle(fontWeight: FontWeight.bold),),
                                        Text(i.time,style: const TextStyle(fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Text('${j.drink.point} Pts',style: const TextStyle(fontSize: 17)),
                                  ],
                                ),
                              )
                          );
                        }
                      }
                    }
                    if(ls.isEmpty){
                      return null;
                    }
                    else {
                      return Column(children: ls,);
                    }
                  },
                ),
              ),
            ],
          )
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(client: widget.client),));
              }, icon: const Icon(Icons.home)),
              IconButton(onPressed: (){
              }, icon: const Icon(Icons.card_giftcard)),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage(),));
              }, icon: const Icon(Icons.bookmark_border)),
            ],
          )
      ),
    );
  }
}