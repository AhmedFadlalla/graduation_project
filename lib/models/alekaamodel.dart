class AlekaModel{
  String? alekaName;
  List<String?>? ingredients;
  String? alekaPrice;

  AlekaModel(this.alekaName,this.ingredients,this.alekaPrice);
  AlekaModel.fromJson(Map<String,dynamic>? json){
    alekaName   =json!['alekaName'];
    alekaPrice  =json['alekaPrice'];
    ingredients=json['ingredients'].cast<String>() ;
  }
  Map<String,dynamic> toMap(){
    return
      {
        'alekaName':alekaName,
        'alekaPrice':alekaPrice,
        'ingredients':ingredients,
        };
  }
}