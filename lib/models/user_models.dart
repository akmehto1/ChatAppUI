class User{
  final  int? id;
  final String? Name;
  final String? Image_URL;
  final String? Lastseen;
  final bool ?block;
  User({this.block,this.id, this.Name, this.Image_URL="assets/images/default",this.Lastseen});

}