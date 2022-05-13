class ProductData{
  String? productName;
  String? productPower;
  String? productPrice;
  String? productProtein;
  String? productMetal;

  ProductData(this.productName,this.productPrice,this.productMetal,this.productPower,this.productProtein);
  ProductData.fromJson(Map<String,dynamic>? json){
    productName   =json!['productName'];
    productPower  =json['productPower'];
    productPrice  =json['productPrice'];
    productProtein=json['productProtein'];
    productMetal  =json['productMetal'];
  }
  Map<String,dynamic> toMap(){
    return
      {
        'productName':productName,
        'productPower':productPower,
        'productPrice':productPrice,
        'productProtein':productProtein,
        'productMetal':productMetal,
      };
  }
}