class HorseData{
  String? horseAge;
  String? horseCase;
  String? horseWeight;
  String? horseFoodQuantity;
  String? proteinsRequired;
  String? powerRequired;
  String? metalRequired;
  String? aleeka;
  String? time;

  HorseData(
      this.horseAge,
      this.horseCase,
      this.horseWeight,
      this.horseFoodQuantity,
      this.proteinsRequired,
      this.powerRequired,
      this.metalRequired,
      this.aleeka,
      this.time,
      );

  HorseData.fromJson(Map<String,dynamic>? json){
    horseAge=json!['horseAge'];
    horseCase=json['horseCase'];
    horseWeight=json['horseWeight'];
    horseFoodQuantity=json['horseFoodQuantity'];
    proteinsRequired=json['proteinsRequired'];
    powerRequired=json['powerRequired'];
    metalRequired=json['metalRequired'];
    aleeka=json['aleeka'];
    time=json['time'];
  }
  Map<String,dynamic> toMap(){
    return
      {
      'horseAge':horseAge,
      'horseCase':horseCase,
      'horseWeight':horseWeight,
      'horseFoodQuantity':horseFoodQuantity,
      'proteinsRequired':proteinsRequired,
      'powerRequired':powerRequired,
      'metalRequired':metalRequired,
      'aleeka':aleeka,
      'time':time,
      };
  }

}