import 'dart:math';

class Client{
  late String? name;
  late String? phone;
  late String? email;
  late String address;
  final int loyalty;
  final int points;
  late List<Cart> list_cart =[];
  Client({this.name,this.phone,this.email,required this.address,required this.loyalty,required this.points});
}
List<Client> list_client = [
  Client(address: 'Nothing', loyalty: 100, points: 1340,name:'User Interface',phone: '023456789',email: 'a1@gmail.com'),
];
class Cart {
  late int? id;
  late bool isDone;
  late List<Contains> list_contains = [];
  Cart({this.id, required this.isDone});
}

class Contains{
  final Drinks drink;
  final int type ;
  Contains({required this.drink,required this.type});
}

class Drinks{
  final String? name ;
  late int price ;
  final String image;
  late int counter = 0;
  Drinks({required this.name,required this.price,required this.image,required this.counter});

  int calculateTotal(){
     return counter*price;
  }
}
List<Drinks> list_drinks = [
  Drinks(name: 'cappucino', price: 25,image:'assets/images/cappucino.jpg',counter:0),
  Drinks(name: 'americano', price: 25,image:'assets/images/americano.jpg',counter:0),
  Drinks(name: 'latte', price: 25,image:'assets/images/latte.jpg',counter:0),
  Drinks(name: 'esspresso', price: 25,image:'assets/images/esspresso.jpg',counter:0),
];