class SinglePropertyLoanModel{
  SinglePropertyLoanModel({required this.dateTime,required this.loanType,required this.interestRateDuration,required this.interestRatePercentage,required this.loanAmount,required this.monthlyPaymentAmount});

  DateTime? dateTime;
  String? loanType;
  String? interestRateDuration;
  String? interestRatePercentage;
  double? loanAmount;
  double? monthlyPaymentAmount;

  Map<String,dynamic> toMap(){
    return {
      'dateTime': dateTime,
      'loanType': loanType,
      'interestRateDuration': interestRateDuration,
      'interestRatePercentage': interestRatePercentage,
      'loanAmount': loanAmount,
      'monthlyPaymentAmount': monthlyPaymentAmount
    };
  }

  SinglePropertyLoanModel.fromJson(Map<String,dynamic> json){
    dateTime = json['dateTime'];
    loanType = json['loanType'];
    interestRateDuration = json['interestRateDuration'];
    interestRatePercentage = json['interestRatePercentage'];
    loanAmount = json['loanAmount'];
    monthlyPaymentAmount = json['monthlyPaymentAmount'];
  }
}