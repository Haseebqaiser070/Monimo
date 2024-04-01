import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:monimo/App/models/SharedPropertyLoanModel.dart';
import 'package:monimo/App/models/SinglePropertyLoanModel.dart';

class IntroQuestionController extends GetxController{

  GlobalKey<FormState> Page1 = GlobalKey<FormState>();

  RxList<String> typeList = <String>['Personal', 'Investment'].obs;
  RxList<String> loanList = <String>[
    'Annuitäten (für gewöhnlich)',
    ' Endfällige Darlehen',
    'Tilgungsdarlehen',
    'Euribor-Darlehen'
  ].obs;

  RxString dropdownLoanValue = "Annuitäten (für gewöhnlich)".obs;
  RxInt activeIndex = 0.obs;
  RxInt percentage = 0.obs;
  RxInt totalIndex = 17.obs;
  RxDouble currentSliderValue = 20.0.obs;
  RxString countryValue = "".obs;
  RxString stateValue = "".obs;
  RxString cityValue = "".obs;
  Rx<SingingCharacter> character = SingingCharacter.no.obs;
  Rx<PropertyLive> propertycharacter = PropertyLive.no.obs;
  Rx<BusinessAssets> businesscharacter = BusinessAssets.no.obs;
  Rx<PlantLoan> plantloancharacter = PlantLoan.no.obs;
  Rx<PropertyLived> propertylivedcharacter = PropertyLived.no.obs;
  bool FieldVisible = false;
  bool FieldSingingVisible = false;

  bool BusinessFieldVisible = false;
  bool PropertyFieldVisible = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  RxList<String> otherLoans = ["Yes", "No"].obs;
  RxInt selectLoan = 0.obs;


  void handleSingingSelection(SingingCharacter? value) {
      character.value = value!;
      FieldSingingVisible = value == PropertyLive.yes;
  }

  void handleSelection(PropertyLive? value) {
      propertycharacter.value = value!;
      FieldVisible = value == PropertyLive.yes;
  }

  void handleBusinessSelection(BusinessAssets? value) {
      businesscharacter.value = value!;
      BusinessFieldVisible = value == BusinessAssets.yes;
  }

  void handlePropertySelection(PropertyLived? value) {
      propertylivedcharacter.value = value!;
      PropertyFieldVisible = value == PropertyLived.yes;
  }

  //******First 3 Common Questions**********
  //1
  TextEditingController question1C = TextEditingController();
  //2
  TextEditingController question2C = TextEditingController();
  //3
  RxList<String> q3List = <String>['Anlage','Eigennutzung'].obs;
  RxString q3Current = "Anlage".obs;

  //******Single Property Question**********

  //4
  RxList<String> contractList = <String>["Auswahl Monat und Jahr",'Geschenkt','Geerbt'].obs;
  RxString currentContractValue = "Geschenkt".obs;
  DateTime? question4Date;

  //Loan related Question
  //5
  RxList<String> loadList = <String>["Auswahl Monat und Jahr",'kein Darlehen'].obs;
  RxString currentLoanValue = "kein Darlehen".obs;
  DateTime? question5Date;
  //6
  RxList<String> loanTypeList = <String>["Annuitäten (für gewöhnlich)",'Endfällige Darlehen','Tilgungsdarlehen','Euribor-Darlehen'].obs;
  RxString currentLoanTypeValue = "Tilgungsdarlehen".obs;
  //7
  RxList<String> q7list = <String>["5",'10 (common)','15','20+','individuell Jahre'].obs;
  RxString currentQ7Value = "5".obs;
  //8
  RxList<String> singleLoantPercentageList = <String>['0%', '1%', '2%', '3%', '4%', '5%', '6%', '7%', '8%', '9%', '10%', '11%', '12%', '13%', '14%', '15%', '16%', '17%', '18%', '19%', '20%', '21%', '22%', '23%', '24%', '25%', '26%', '27%', '28%', '29%', '30%', '31%', '32%', '33%', '34%', '35%', '36%', '37%', '38%', '39%', '40%', '41%', '42%', '43%', '44%', '45%', '46%', '47%', '48%', '49%', '50%', '51%', '52%', '53%', '54%', '55%', '56%', '57%', '58%', '59%', '60%', '61%', '62%', '63%', '64%', '65%', '66%', '67%', '68%', '69%', '70%', '71%', '72%', '73%', '74%', '75%', '76%', '77%', '78%', '79%', '80%', '81%', '82%', '83%', '84%', '85%', '86%', '87%', '88%', '89%', '90%', '91%', '92%', '93%', '94%', '95%', '96%', '97%', '98%', '99%', '100%'].obs;
  RxString singleLoanPercentCurrent = "10%".obs;
  //9
  TextEditingController question9C = TextEditingController();
  //10
  TextEditingController question10C = TextEditingController();

  //11
  RxList<String> singleq11List = <String>['Yes','No'].obs;
  RxString singleq11Current = "No".obs;
  //have you taken another loan start again from question 5


  List<SinglePropertyLoanModel> singlePropertyLoanList = [];
  List<SharedPropertyLoanModel> sharedPropertyLoanList = [];

  //******Shared Property Question**********
  //4
  RxList<String> sharedQuestion4 = <String>["Auswahl Monat und Jahr",'Geschenkt','Geerbt'].obs;
  RxString sharedQuestion4Value = "Geschenkt".obs;
  DateTime? sharedquestion4DateTime;
  //5
  Rx<DateTime> q5date = DateTime(1200).obs;
  //if date is befor 2006
  RxList<String> q5_1List = <String>['Yes','No'].obs;
  RxString q5_1Current = "No".obs;
  //if date is between 2018 - 2021
  RxList<String> q5_2List = <String>['Yes','No'].obs;
  RxString q5_2Current = "No".obs;
  RxList<String> q5_2_2List = <String>['Yes','No'].obs;
  RxString q5_2_2Current = "No".obs;
  //if Yes
  TextEditingController sharequestion5TextC = TextEditingController();
  //6
  RxList<String> q6List = <String>['Yes','No'].obs;
  RxString q6Current = "No".obs;
  //If yes
  TextEditingController shareq6TextC = TextEditingController();
  //7
  RxList<String> q7List = <String>['Yes','No'].obs;
  RxString q7Current = "No".obs;
  //if yes
  RxList<String> q7_1List = <String>['Yes','No'].obs;
  RxString q7_1Current = "No".obs;
  //if yes
  TextEditingController sharedq7TextC1 = TextEditingController();
  TextEditingController sharedq7TextC2 = TextEditingController();
  TextEditingController sharedq7TextC3 = TextEditingController();
  //8
  RxList<String> q8List = <String>["Auswahl Monat und Jahr",'kein Darlehen'].obs;
  RxString q8Current = "kein Darlehen".obs;
  DateTime? sharedquestion8Date;
  //9
  RxList<String> q9List = <String>["5",'10 (common)','15','20+','individuell Jahre'].obs;
  RxString q9Current = "10 (common)".obs;
  //10
  RxList<String> q10List = <String>['0%', '1%', '2%', '3%', '4%', '5%', '6%', '7%', '8%', '9%', '10%', '11%', '12%', '13%', '14%', '15%', '16%', '17%', '18%', '19%', '20%', '21%', '22%', '23%', '24%', '25%', '26%', '27%', '28%', '29%', '30%', '31%', '32%', '33%', '34%', '35%', '36%', '37%', '38%', '39%', '40%', '41%', '42%', '43%', '44%', '45%', '46%', '47%', '48%', '49%', '50%', '51%', '52%', '53%', '54%', '55%', '56%', '57%', '58%', '59%', '60%', '61%', '62%', '63%', '64%', '65%', '66%', '67%', '68%', '69%', '70%', '71%', '72%', '73%', '74%', '75%', '76%', '77%', '78%', '79%', '80%', '81%', '82%', '83%', '84%', '85%', '86%', '87%', '88%', '89%', '90%', '91%', '92%', '93%', '94%', '95%', '96%', '97%', '98%', '99%', '100%'].obs;
  RxString q10Current = "10%".obs;
  //11
  TextEditingController sharedQ11TextC = TextEditingController();
  //12
  TextEditingController sharedQ12TextC = TextEditingController();
  //13
  RxList<String> q13List = <String>['Yes','No'].obs;
  RxString q13Current = "No".obs;
  //if yes start question again from question 8
  //14
  TextEditingController sharedQ14TextC = TextEditingController();
  //15
  TextEditingController sharedQ15TextC = TextEditingController();
  //16
  TextEditingController sharedQ16TextC = TextEditingController();
  //17
  RxList<String> q17List = <String>['Yes','No'].obs;
  RxString q17Current = "No".obs;
  //if yes
  TextEditingController sharedQ17TextC = TextEditingController();




  //++++++++++++**********
  RxList<String> q12list = <String>["Auswahl Monat und Jahr",'Geschenkt / Geerbt'].obs;
  RxString currentQ12Value = "Geschenkt / Geerbt".obs;
  //++++++++++++**********

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  Widget buildDefaultSingleDatePickerWithValue(String questionNo) {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: Colors.blueAccent,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      // selectableDayPredicate: (day) => !day
      //     .difference(DateTime.now().subtract(const Duration(days: 3)))
      //     .isNegative,
      // firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Text('Datum auswählen',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
          CalendarDatePicker2(
              config: config,
              value: _singleDatePickerValueWithDefaultValue,
              onValueChanged: (dates){
                  _singleDatePickerValueWithDefaultValue = dates;
                  DateTime? dateTime = dates[0];
                  print(dateTime);
                  switch(questionNo){
                    case "single4":
                      question4Date = dateTime;
                    case "single5":
                      question5Date = dateTime;
                    case "shared4":
                      sharedquestion4DateTime = dateTime;
                    case "shared8":
                      sharedquestion8Date = dateTime;
                  }
              }
          ),
        ],
      ),
    );
  }


  String _getValueText(
      CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,
      ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }
}


//Radio Buttons
enum SingingCharacter { yes, no }

enum PropertyLive { yes, no }

enum BusinessAssets { yes, no }

enum PlantLoan { yes, no }

enum PropertyLived { yes, no }


