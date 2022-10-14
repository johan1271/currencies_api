
class Value{
  late String valueFrom;
  late String valueTo;

  

  Value(this.valueFrom, this.valueTo);

  String get getValueFrom{
    return valueFrom;
  }

  set setValueFrom(valueFrom){
    this.valueFrom = valueFrom;
  }


  String get getValueTo{
    return valueTo;
  }

  set setValueTo(valueTo){
    this.valueTo = valueTo;
  }


}