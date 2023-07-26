
class Client{
  late String? name;
  late String? phone;
  late String? email;
  late String address;
  final int loyalty;
  late int points;
  late List<Cart> list_cart =[];
  Client({this.name,this.phone,this.email,required this.address,required this.loyalty,required this.points});
}
List<Client> list_client = [
  Client(address: 'Nothing', loyalty: 100, points: 1340,name:'User Interface',phone: '023456789',email: 'a1@gmail.com'),
];
class Cart {
  late String time = '';
  late int? id;
  late bool isDone;
  late List<Contains> list_contains = [];
  Cart({this.id, required this.isDone});

  int calCart(){
    int total = 0;
    late int shot = 0;
    late int select =0;
    late int size =0;
    late int ice =0;
    late int temp = 0;
    for(var i in list_contains){
      shot = (i.type / 1000).round();
      temp = (i.type / 100 - shot*10).round();
      size = (i.type / 10 - temp*10 - shot*100).round();
      ice =  (i.type / 1 - size*10 - temp*100-shot*1000).round();
      total += i.drink.counter * (i.drink.price + size - 1 + shot - 1);
    }
    return total;
  }
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
  late int? point = 12;
  Drinks({required this.name,required this.price,required this.image,required this.counter,this.point});

  int calculateTotal(int size,int shot){
    return counter*(price + size -1 + shot -1);
  }
}
List<Drinks> list_voucher = [
  Drinks(name: 'Cappucino', price: 25,image:'assets/images/cappucino.jpg',counter:0,point: 1340),
  Drinks(name: 'Americano', price: 25,image:'assets/images/americano.jpg',counter:0,point: 1200),
  Drinks(name: 'Latte', price: 25,image:'assets/images/latte.jpg',counter:0,point: 1200),
  Drinks(name: 'Esspresso', price: 25,image:'assets/images/esspresso.jpg',counter:0,point: 1000),
];
List<Drinks> list_drinks = [
  Drinks(name: 'Cappucino', price: 25,image:'assets/images/cappucino.jpg',counter:0),
  Drinks(name: 'Americano', price: 25,image:'assets/images/americano.jpg',counter:0),
  Drinks(name: 'Latte', price: 25,image:'assets/images/latte.jpg',counter:0),
  Drinks(name: 'Esspresso', price: 25,image:'assets/images/esspresso.jpg',counter:0),
];