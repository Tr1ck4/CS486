// /*
// class ClientField{
//   static final List<String> values = [
//     name,phone,email,address,loyalty,points
//   ];
//   static final String name = '_name';
//   static final String phone = '_phone';
//   static final String email = '_email';
//   static final String address = '_address';
//   static final String loyalty = '_loyalty';
//   static final String points = '_points';
// }
// class Client{
//   late final String? name;
//   late final String? phone;
//   late final String? email;
//   late final String address;
//   final int loyalty;
//   final int points;
//   Client({this.name,this.phone,this.email,required this.address,required this.loyalty,required this.points});
//
//   Client copy({
//     String?   name,
//     String?   phone,
//     String?   email,
//     String?   address,
//     int?      loyalty,
//     int?      points,
//   }) =>
//       Client(
//         name:     name??this.name,
//         phone:    phone??this.phone,
//         address:  address??this.address,
//         email:    email??this.email,
//         loyalty:  loyalty??this.loyalty,
//         points:   points??this.points,
//       );
//
//   static Client fromJson(Map<String, Object?> json) => Client(
//     name: json[ClientField.name] as String?,
//     phone: json[ClientField.phone] as String?,
//     address: json[ClientField.address] as String,
//     email: json[ClientField.email] as String?,
//     loyalty: json[ClientField.loyalty] as int,
//     points: json[ClientField.points] as int,
//
//   );
//   Map<String, Object?> toJson() => {
//     ClientField.name: name,
//     ClientField.phone: phone,
//     ClientField.address: address,
//     ClientField.email: email,
//     ClientField.loyalty: loyalty,
//     ClientField.points: points,
//   };
// }
// class CartField{
//   static final List<String> values = [
//     id,isDone,name,phone,email
//   ];
//   static final String name = '_name';
//   static final String phone = '_phone';
//   static final String email = '_email';
//   static final String id = '_id';
//   static final String isDone = '_isDone';
// }
// class Cart{
//   final int? id ;
//   final bool isDone;
//   final String name ;
//   final String phone ;
//   final String email ;
//   Cart({this.id,required this.isDone,required this.name,required this.phone,required this.email});
//
//   Cart copy({
//      int?  id ,
//      bool ?   isDone,
//      String?  name ,
//      String?  phone ,
//      String?  email ,
//   }) =>
//       Cart(
//         id : id ??this.id,
//         isDone: isDone??this.isDone,
//         name : name ??this.name,
//         phone : phone??this.phone,
//         email : email??this.email,
//       );
//
//   static Cart fromJson(Map<String, Object?> json) => Cart(
//     id: json[CartField.id] as int?,
//     isDone: json[CartField.isDone] == 1,
//     phone: json[CartField.phone] as String,
//     email: json[CartField.email] as String,
//     name: json[CartField.name] as String,
//   );
//
//   Map<String, Object?> toJson() => {
//     CartField.id: id,
//     CartField.name: name,
//     CartField.isDone: isDone ? 1 : 0,
//     CartField.phone: phone,
//     CartField.email: email,
//   };
// }
//
// class ContainsField{
//   static final List<String> values = [
//     name,id,type
//   ];
//   static final String name = '_name';
//   static final String id = '_id';
//   static final String type = '_type';
// }
//
// class Contains{
//   final String name ;
//   final int? id ;
//   final int type ;
//   Contains({required this.name,this.id,required this.type});
//
//   Contains copy({
//     int?  id ,
//     String?  name ,
//     int?  type ,
//   }) =>
//       Contains(
//         name: name??this.name,
//         id : id ??this.id,
//         type : type??this.type,
//       );
//
//   static Contains fromJson(Map<String, Object?> json) => Contains(
//       name: json[ContainsField.name] as String,
//       id: json[ContainsField.id] as int?,
//       type: json[ContainsField.type] as int
//   );
//
//   Map<String, Object?> toJson() => {
//     ContainsField.name: name,
//     ContainsField.id: id,
//     ContainsField.type: type,
//   };
// }
//
// class DrinksField{
//   static final List<String> values = [
//     name,price,type
//   ];
//   static final String name = '_name';
//   static final String price = '_price';
//   static final String type = '_type';
// }
//
// class Drinks{
//   final String? name ;
//   final int price ;
//   final int type ;
//   Drinks({required this.name,required this.price,required this.type});
//
//   Drinks copy({
//     String?  id ,
//     String?  name ,
//     int?  price ,
//     int?  type ,
//     int? counter,
//   }) =>
//       Drinks(
//         name: name??this.name,
//         price : price ??this.price,
//         type : type??this.type,
//       );
//
//   static Drinks fromJson(Map<String, Object?> json) => Drinks(
//     name: json[DrinksField.name] as String?,
//     price: json[DrinksField.price] as int,
//     type: json[DrinksField.type] as int
//   );
//
//   Map<String, Object?> toJson() => {
//       DrinksField.name: name,
//       DrinksField.price: price,
//       DrinksField.type: type,
//     };
// }*/
