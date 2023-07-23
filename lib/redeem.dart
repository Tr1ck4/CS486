import 'package:flutter/material.dart';

class RedeemPage extends StatefulWidget{
  const RedeemPage({super.key});
  @override
  State<RedeemPage> createState()=>_RedeemPage();
}

class _RedeemPage extends State<RedeemPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child:Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BackButton(onPressed: (){},color: Colors.black,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        height: 40,
                        child: const Text('Redeem',style: TextStyle(fontSize: 25),),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    height: MediaQuery.of(context).size.height/10,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.height/12,
                          height: MediaQuery.of(context).size.height/12,
                          child: Image(image: AssetImage('assets/images/esspresso.jpg'),fit: BoxFit.cover,),// image item
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.height/4.5,
                          height: MediaQuery.of(context).size.height/12,
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}