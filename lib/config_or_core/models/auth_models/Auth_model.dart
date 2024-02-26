
import 'package:equatable/equatable.dart';

class AuthModel extends Equatable{
  final String name;
  final String email;
  final String password;
  final String tokenid;
  const AuthModel({
      required this.email,
      required this.password,
      required this.name,
      required this.tokenid
  });
 Map<String,dynamic> toMap (){
   return {
     "name":name,
     "email":email,
     "password":password,
     "tokenid":tokenid,
   };
 }
  @override
  List<Object?> get props => [name,email,password,tokenid];
}
