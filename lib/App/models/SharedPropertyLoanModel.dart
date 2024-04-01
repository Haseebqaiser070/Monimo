
class SharedPropertyLoanModel{
  SharedPropertyLoanModel({required this.dateTime,required this.interestRateDuration,required this.interestRatePercentage,required this.loanAmount,required this.monthlyPaymentAmount});

  DateTime? dateTime;
  String? interestRateDuration;
  String? interestRatePercentage;
  double? loanAmount;
  double? monthlyPaymentAmount;

  Map<String,dynamic> toMap(){
    return {
      'dateTime': dateTime,
      'interestRateDuration': interestRateDuration,
      'interestRatePercentage': interestRatePercentage,
      'loanAmount': loanAmount,
      'monthlyPaymentAmount': monthlyPaymentAmount
    };
  }

  SharedPropertyLoanModel.fromJson(Map<String,dynamic> json){
    dateTime = json['dateTime'];
    interestRateDuration = json['interestRateDuration'];
    interestRatePercentage = json['interestRatePercentage'];
    loanAmount = json['loanAmount'];
    monthlyPaymentAmount = json['monthlyPaymentAmount'];
  }
}