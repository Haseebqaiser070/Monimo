import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monimo/App/App%20Routes/Routes.dart';
import 'package:monimo/App/models/SinglePropertyLoanModel.dart';
import 'package:monimo/App/modules/HomeScreen/HomeScreen.dart';
import 'package:monimo/App/modules/IntroQuestion/IntroQuestionController.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../models/SharedPropertyLoanModel.dart';
import 'IntroQuestionWidget.dart';


class IntroQuestion extends GetView<IntroQuestionController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final PageController pageController = PageController();

    return PageView(
      controller: pageController,
      children: [
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[Color(0xff1f5e70), Color(0xff76cce3)],
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffBDFAF0),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Image(image: AssetImage('assets/monlmo.png')),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Obx(() => bodyBuilder(context)

                    /*
                controller.activeIndex.value == 0
                    ? page1(context)
                    : controller.activeIndex.value == 1
                        ? sharedPage1(context)
                        : controller.activeIndex.value == 2
                            ? personalPage(context)
                            : controller.activeIndex.value == 3
                                ? PlantPage(context)
                                : controller.activeIndex.value == 4
                                    ? PlantSubpage1(context)
                                    : controller.activeIndex.value == 5
                                        ? PlantSubpage2(context)
                                        : controller.activeIndex.value == 6
                                            ? PlantSubpage3(context)
                                            : page1(context)
                 */
                    ),
              ),
            ),
          ),
        ),
        HomeScreen(),
      ],
    );
  }

  Widget bodyBuilder(BuildContext context) {
    switch (controller.activeIndex.value) {
      case 0:
        return page1(context);
      case 1:
        return personalPage1(context);
      case 2:
        return personalPage2(context);
      case 3:
        return personalPage3(context);
      case 4:
        return sharedPage1(context);
      case 5:
        return sharedPage2(context);
      case 6:
        return sharedPage3(context);
      default:
        return page1(context);
    }
  }

  //1, 2, 3
  Widget page1(BuildContext context) {
    return Form(
      key: controller.Page1,
      child: ListView(
        children: [
          reusableProgress(),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(Icons.close)),
                                  ],
                                ),
                                Text(
                                  "Cancellations: If you have received a notice from a tenant, you can enter it here, Monimo will then remind you at least 30 days in advance and you can start looking for a new tenant, for example. First of all: The tenant can terminate the contract with a notice period of three months. You must have received the cancellation by the third working day at the latest... this is just a reminder.Here are our tips for new rentals:- Pay attention to the rent index in your region: Zip code rent index - There may be a rental price brake* in your region (applies to you Rent control, the net rent may only be 10% above the comparative value for a new rental. For this, look at the rent index for your region.) Rent brake: *The rental price brake only applies if the property was re-let after the law came into force (depending on the federal state).For new buildings after September 2014 there is no rent control. Previous rents (for residential purposes) that already showed an excessive rent before the rent brake came into force may be continued at this level and demanded.If your modernization measures before the new rental are so comprehensive that approx. a third of the effort for a new apartmentor the status of a new building is reached, the rental price brake also does not apply.If you rent a furnished apartment, approx. 2% of the purchase costs of the furniture can be allocated to the rent. However, therental price brake still applies.Temporary rental contract: If you rent a furnished apartment for a limited period of time (temporary rental contract up to 12months), there is no rent cap!By the way: Recommend your tenants to take out private liability insurance and contents insurance.We recommend the following documents for the rental applicant to be checked:- Tenant self-assessment (even if this is not mandatory as a tenant applicant)- Copy of identity card or passport- The last three pay slips or other proof of income (Our recommendation: the rent should not be more than 1/3 of the total income)- A Schufa information- Certificate of prior landlord (not mandatory)To the rental agreement:- It is best to use current form rental contracts.- All future adult residents of the apartment should be named in the rental agreement with their full name, previous registeredaddress and date of birth and sign them personally.- When handing over the apartment, the rental deposit and the first rent payment should be submittedbe received by you as a landlord.- Rental scales are allowed, but you must not violate the rental price brake.- Index rents rise or fall parallel to the published consumer price index (the Destatis calculator can be useful for calculating thechanges : https://www.destatis.de/DE/Themen/Wirtschaft/ Prices/Verwachsenerpreisindex/Methods/ Internetprogramm.html )For handing over the apartment:- Document the handover of the apartment (preferably with photos) for the current condition and note the current meter readingsfor electricity, gas and water.landlord confirmationIf your new tenants need a confirmation from the landlord to prove to the Citizens’ Registration Office, you must hand it overwithin the first two weeks after moving in.If you prefer to hire a broker for the new rental, you can of course deduct the costs for this!Option:If you have a commercial tenant where the tenant has the option to extend the tenancy, you can set the decision date here.",
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.question_mark_outlined,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (v){
              if(v == ""){
                return "This Field is Required.";
              }
            },
            controller: controller.question1C,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Gib Deinem Objekt einen Name',
                hintStyle: TextStyle(fontSize: 14)),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (v){
              if(v == ""){
                return "This Field is Required.";
              }
            },
            controller: controller.question2C,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Wo steht Deine Immobilie (PLS = Bundesland)',
                hintStyle: TextStyle(fontSize: 14)),
          ),

          SizedBox(
            height: 15,
          ),
          Text(
            "Als Anlage oder Elgennutzung?",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          dropdownQuestion(controller.q3Current, controller.q3List),

          // Text(
          //   "Hast Du weitere Darlehen in Anspruch genommen?",
          //   style: TextStyle(color: Colors.white),
          // ),
          // Obx(() => RadioListTile(
          //       title: const Text(
          //         'Yes',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       value: SingingCharacter.yes,
          //       groupValue: controller.character.value,
          //       onChanged: controller.handleSingingSelection,
          //     )),
          // Obx(() => RadioListTile(
          //   title: const Text(
          //     'No',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   value: SingingCharacter.no,
          //   groupValue: controller.character.value,
          //   onChanged: controller.handleSingingSelection,
          // )),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              if(controller.Page1.currentState!.validate()){
                if (controller.q3Current.value == "Anlage") {
                  controller.activeIndex.value = 4;
                  controller.percentage += 10;
                } else {
                  controller.activeIndex.value = 1;
                  controller.percentage += 10;
                }
              }
            },
            child: Text('Weiter'),
          ),
        ],
      ),
    );
  }

  /*
  Widget sharedPage1(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Anlage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Q4++++++++
            StatementQuestion("Wann hast Du den Kaufvertrag unterschrieben?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "U.a. entscheidend für Die Spekulationssteuerfrist. Übrigens, wenn Du “bewegliche Extras“ wie z.B. Einbauküchen, Markisen, Photovoltaikanlagen, Saunen oder Gartenhäuser imKaufvertrag gesondert aufführst, musst Du auf diese Dinge womöglich keine Grunderwerbssteuer zahlen.Bei einer WEG wird auf Deinem erworbenen Anteil der Instandhaltungsrücklage ebenfalls keine Grundsteuer fällig. Sprich Deinen Notar direkt darauf an.",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(
                controller.currentContractValue, controller.contractList),
            Obx(() => controller.currentContractValue.value ==
                "Auswahl Monat und Jahr"
                ? controller.buildDefaultSingleDatePickerWithValue()
                : SizedBox()),
            //Q5++++++++++++++++
            SizedBox(
              height: 10,
            ),
            StatementQuestion("Wann war das Übergabedatum?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Info: passender gesagt, wann war diese bezugsfertig d.h. wesentliche Bestandteile sind installiert, unwesentliche Restarbeiten sind unerheblich U.a. wichtig für Deine Abschreibung und Wartungsintervalle",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () async {
                BottomPicker.date(
                  title: 'Set Termination Date',
                  dateOrder: DatePickerDateOrder.dmy,
                  pickerTextStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                  onChange: (index) {},
                  onSubmit: (index) {
                    DateTime dateTime = index;
                    controller.q5date.value = dateTime;
                    print(DateTime(2006).compareTo(controller.q5date.value));
                  },
                  bottomPickerTheme: BottomPickerTheme.plumPlate,
                ).show(context);
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Select Date",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Obx(() => DateTime(2006).compareTo(controller.q5date.value) == 1
                ? Column(
              children: [
                StatementQuestion(
                    "Hast Du Dich damals für eine degressive Immobilienabschreibung entschieden?",
                        () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              width: Get.width,
                              // height: 300,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close)),
                                    ],
                                  ),
                                  Text(
                                    "Info: Seit dem 01.01.2006 können Immobilien nur Linear abgeschrieben werden. Solltest Du damals eine degressive Abschreibung gewählt haben, ist die Wahrscheinlichkeit hoch, dass Du mittlerweile von der geringen Abschreibungsmöglichkeit benachteiligt wirst. Sprich einmal Deinen Steuerberater darauf an. Nach Erbe oder Schenkung darfst Du die bisherige AfA in dem gleichen Umfang weiterführen. Mehr unter: (§ 11d EStDV). PS: Dies kann sich bei einer degressiven AfA (vor 2006) auch negativ auswirken.",
                                    textAlign: TextAlign.justify,
                                  )
                                ],
                              ),
                            );
                          });
                    }),
                dropdownQuestion(
                    controller.q5_1Current, controller.q5_1List),
              ],
            )
                : SizedBox()),

            SizedBox(
              height: 15,
            ),
            Obx(
                  () => DateTime(2018).compareTo(controller.q5date.value) == -1 &&
                  DateTime(2021).compareTo(controller.q5date.value) == 1
                  ? Column(
                children: [
                  StatementQuestion(
                      "Hast Du Dich für die Sonder-AfA (nach § 7b EstG.) entschieden?",
                          () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                width: Get.width,
                                // height: 300,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(Icons.close)),
                                      ],
                                    ),
                                    Text(
                                      "Info: Für Neugeschaffenen Wohnraum konnten zwischen 2018 und 2021 eine „Sonder-AFA“ von zusätzlichen 5% in den ersten 4 Jahren gewährt werden. Dafür mussten allerdings einige Voraussetzung erfüllt sein. U.a. müssen Wohnungen min. 10 Jahren zu Wohnzwecken vermietet werden. Die Herstellungs- beziehungsweise Anschaffungskosten einschließlich Kaufnebenkosten dürfen 3.000 Euro je Quadratmeter nicht überschreiten. Für mehr Informationen siehe Paragraphen 7b EstG. Übrigens, sobald Du Hecken Büsche oder Bäume an den Grundstücksgrenzen zur „lebenden Umzäunung“ pflanzt, können diese zu den Herstellungskosten hinzugerechnet und somit abgeschrieben werden.",
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              );
                            });
                      }),
                  dropdownQuestion(
                      controller.q5_2Current, controller.q5_2List),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )
                  : SizedBox(),
            ),
            StatementQuestion("Hast Du Wohnraum?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "z.b. durch Umnutzung oder Ausbau in Deiner Immobilie geschaffen und die Sonder-AfA für diesen Teil aktiviert?",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            dropdownQuestion(controller.q5_2_2Current, controller.q5_2_2List),
            SizedBox(
              height: 15,
            ),
            Obx(() => controller.q5_2_2Current.value == "Yes"
                ? TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText:
                  'Wie hoch waren die Kosten für die Wohnraumschaffung',
                  hintStyle: TextStyle(fontSize: 14)),
            )
                : SizedBox()),
            //Q6+++++++++++++++++
            SizedBox(
              height: 15,
            ),
            StatementQuestion("Wohnst Du ebenfalls im Objekt?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Info: Übrigens: Sollte sich einmal die Nutzung der Flächen verändern, verlieren Sie für gewöhnlich nicht Ihre Abschreibungseigenschaften",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            dropdownQuestion(controller.q6Current, controller.q6List),
            SizedBox(
              height: 15,
            ),
            Obx(() => controller.q6Current.value == "Yes"?
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie Groß ist die Fläche die Du bewohnst?',
                  hintStyle: TextStyle(fontSize: 14)),
            ):SizedBox(),),
            SizedBox(
              height: 15,
            ),
            StatementQuestion(
                "Hast Du einen Betrieb im Objekt das zu Deinem Betriebsvermögen gehört?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "In diesem Fall kann eine Höhere Abschreibung gewährt werden.",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            dropdownQuestion(controller.q7Current, controller.q7List),
            Obx(() =>  controller.q7Current.value == "Yes"?
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                StatementQuestion(
                    "Wurde der ursprüngliche Bauantrag für das Gebäude bzw. Ihrer Betriebsfläche nach 31.03.1985 gestellt? ",
                        () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              width: Get.width,
                              // height: 300,
                              padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close)),
                                    ],
                                  ),
                                  Text(
                                    "In diesem Fall kann eine Höhere Abschreibung gewährt werden.",
                                    textAlign: TextAlign.justify,
                                  )
                                ],
                              ),
                            );
                          });
                    }),
                dropdownQuestion(controller.q7_1Current, controller.q7_1List),
              ],
            ):SizedBox(),),
            Obx(() => controller.q7_1Current.value == "Yes"?
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Wie groß ist die Fläche? ',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'Wie groß ist die Bruttogeschossfläche des Gebäudes?',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Wieviel vermietete Nutzfläche hat Dein Objekt?',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ],
            ):SizedBox()),
            SizedBox(
              height: 10,
            ),
            //Q8++++++++++
            StatementQuestion("Wann hast Du das Darlehen in Anspruch genommen?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(controller.q8Current, controller.q8List),
            Obx(() => controller.q8Current.value == "Auswahl Monat und Jahr"
                ? controller.buildDefaultSingleDatePickerWithValue()
                : SizedBox()),
            SizedBox(
              height: 5,
            ),
            StatementQuestion("Wann hast Du das Darlehen in Anspruch genommen?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            dropdownQuestion(controller.q9Current, controller.q9List),
            SizedBox(
              height: 15,
            ),
            // Q10++++++++++
            StatementQuestion("Zinshöhe?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            dropdownQuestion(controller.q10Current, controller.q10List),
            // Q11++++++++++
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Darlehenshöhe?',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q12++++++++++
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText:
                  'Wie hoch ist die monatliche Rate (auch Annuität genannt) dafür?',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q13++++++++++
            StatementQuestion(
                "Hast Du ein weiteres Darlehen für diese Immobilie aufgenommen?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            dropdownQuestion(controller.q13Current, controller.q13List),
            // Q14++++++++++
            SizedBox(
              height: 15,
            ),
            StatementQuestion("Wie hoch war Dein eingebrachtes Eigenkapital?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "Je geringer Dein eingebrachtes Eigenkapital, desto höher die Eigenkapitalrendite.",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie hoch war Dein eingebrachtes Eigenkapital?',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q15++++++++++
            StatementQuestion("Wie hoch ist die Jahresnettomiete?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "(auch Kaltmiete genannt, Miete ohne Nebenkosten (bei WEG: abzüglich Instandhaltungsrücklagen und Verwaltergebühren)",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie hoch ist die Jahresnettomiete?',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q16++++++++++
            StatementQuestion("Wie ist das Baujahr?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Das Baujahr entscheidet u.a. über Deine Nutzungsdauer und somit über die Abschreibungshöhe.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie ist das Baujahr',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q17++++++++++
            StatementQuestion(
                "Hast Du die Immobilie einmal ausschließlich selber bewohnt?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "Wir berechnen für Dich die Restnutzungsdauer Deines Objektes. Eventuell verändert sich hierdurch auch die Spekulationssteuerfrist Deines Objektes!",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            dropdownQuestion(controller.q17Current, controller.q17List),
            SizedBox(
              height: 5,
            ),
            Obx(() => controller.q17Current.value == "Yes"?
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie viele Jahre?',
                  hintStyle: TextStyle(fontSize: 14)),
            ):SizedBox(),),
            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 0;
                    controller.percentage -= 10;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex++;
                    controller.percentage += 10;
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  */

  /*
  Widget personalPage1(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eigennutzung",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StatementQuestion("Wann hast Du den Kaufvertrag unterschrieben?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "U.a. entscheidend für Die Spekulationssteuerfrist. Übrigens, wenn Du “bewegliche Extras“ wie z.B. Einbauküchen, Markisen, Photovoltaikanlagen, Saunen oder Gartenhäuser imKaufvertrag gesondert aufführst, musst Du auf diese Dinge womöglich keine Grunderwerbssteuer zahlen.Bei einer WEG wird auf Deinem erworbenen Anteil der Instandhaltungsrücklage ebenfalls keine Grundsteuer fällig. Sprich Deinen Notar direkt darauf an.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(
                controller.currentContractValue, controller.contractList),
            Obx(() => controller.currentContractValue.value ==
                    "Auswahl Monat und Jahr"
                ? controller.buildDefaultSingleDatePickerWithValue()
                : SizedBox()),

            //Q5
            SizedBox(
              height: 10,
            ),
            StatementQuestion("Wann hast Du das Darlehen in Anspruch genommen?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Auswahl Monat und Jahr oder Auswahlmöglichkeit kein Darlehen.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(controller.currentLoanValue, controller.loadList),
            Obx(() =>
                controller.currentLoanValue.value == "Auswahl Monat und Jahr"
                    ? controller.buildDefaultSingleDatePickerWithValue()
                    : SizedBox()),
            SizedBox(
              height: 5,
            ),
            //Q6
            SizedBox(
              height: 10,
            ),
            StatementQuestion("Art des Darlehens?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Für Gewöhnlich werden Annuitätendarlehen (Du zahlst anhaltend dieselbe Rate die sich aus Zinsen und Tilgung zusammensetzt) vereinbart, sollte dies bei Dir anders sein, kreuzen das richtige Darlehen an:Endfällige Darlehen (auch Festdarlehen) / Du zahlst nur die Zinsen und Tilgst nicht. Tilgungsdarlehen / Tilgungsanteil bleibt immer gleich, dadurch fällt der Zinsanteil und du zahlst monatlich eine kleiner werden RateEuribor-Darlehen / Deine Zinsen variieren alle 3 Monate",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(
                controller.currentLoanTypeValue, controller.loanTypeList),
            SizedBox(
              height: 15,
            ),
            //Q7
            StatementQuestion("Wie lang ist Deine Zinsbindung?", () {}),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(controller.currentQ7Value, controller.q7list),
            SizedBox(
              height: 10,
            ),
            Text(
              "Wie hoch sind Deine Zinsen?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie hoch sind Deine Zinsen',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Wie hoch ist das Darlehen das Du in Anspruch genommen hast?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText:
                      'Wie hoch ist das Darlehen das Du in Anspruch genommen hast',
                  hintStyle: TextStyle(fontSize: 12)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Wie hoch ist die monatliche Rate (auch Annuität genannt)?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText:
                      'Wie hoch ist die monatliche Rate (auch Annuität genannt)',
                  hintStyle: TextStyle(fontSize: 12)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hast Du weitere Darlehen in Anspruch genommen?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex--;
                    controller.percentage -= 10;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex++;
                    controller.percentage += 10;
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  */

  // 4
  Widget personalPage1(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eigennutzung",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //4
            StatementQuestion("Wann hast Du den Kaufvertrag unterschrieben?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "U.a. entscheidend für Die Spekulationssteuerfrist. Übrigens, wenn Du “bewegliche Extras“ wie z.B. Einbauküchen, Markisen, Photovoltaikanlagen, Saunen oder Gartenhäuser imKaufvertrag gesondert aufführst, musst Du auf diese Dinge womöglich keine Grunderwerbssteuer zahlen.Bei einer WEG wird auf Deinem erworbenen Anteil der Instandhaltungsrücklage ebenfalls keine Grundsteuer fällig. Sprich Deinen Notar direkt darauf an.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(
                controller.currentContractValue, controller.contractList),
            Obx(() => controller.currentContractValue.value ==
                    "Auswahl Monat und Jahr"
                ? controller.buildDefaultSingleDatePickerWithValue("single4")
                : SizedBox()),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 0;
                    controller.percentage.value = 0;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.currentContractValue.value == "Auswahl Monat und Jahr"){
                      if(controller.question4Date == null){
                        Fluttertoast.showToast(msg: "Enter Date");
                        return;
                      }
                    }
                    controller.activeIndex.value = 2;
                    controller.percentage.value = 30;
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // 5, 6, 7, 8, 9, 10
  Widget personalPage2(BuildContext context) {
    GlobalKey<FormState> formPage2Key = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formPage2Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eigennutzung",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //Q5
            SizedBox(
              height: 10,
            ),
            StatementQuestion("Wann hast Du das Darlehen in Anspruch genommen?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "Auswahl Monat und Jahr oder Auswahlmöglichkeit kein Darlehen.",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(controller.currentLoanValue, controller.loadList),

           Obx(() => controller.currentLoanValue.value == "Auswahl Monat und Jahr"?Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               controller.buildDefaultSingleDatePickerWithValue("single5"),
               SizedBox(
                 height: 5,
               ),
               //Q6
               SizedBox(
                 height: 10,
               ),
               StatementQuestion("Art des Darlehens?", () {
                 showModalBottomSheet(
                     context: context,
                     shape: const RoundedRectangleBorder(
                       // <-- SEE HERE
                       borderRadius: BorderRadius.vertical(
                         top: Radius.circular(25.0),
                       ),
                     ),
                     builder: (context) {
                       return Container(
                         width: Get.width,
                         // height: 300,
                         padding:
                         EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(10)),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 IconButton(
                                     onPressed: () {
                                       Get.back();
                                     },
                                     icon: Icon(Icons.close)),
                               ],
                             ),
                             Text(
                               "Für Gewöhnlich werden Annuitätendarlehen (Du zahlst anhaltend dieselbe Rate die sich aus Zinsen und Tilgung zusammensetzt) vereinbart, sollte dies bei Dir anders sein, kreuzen das richtige Darlehen an:Endfällige Darlehen (auch Festdarlehen) / Du zahlst nur die Zinsen und Tilgst nicht. Tilgungsdarlehen / Tilgungsanteil bleibt immer gleich, dadurch fällt der Zinsanteil und du zahlst monatlich eine kleiner werden RateEuribor-Darlehen / Deine Zinsen variieren alle 3 Monate",
                               textAlign: TextAlign.justify,
                             )
                           ],
                         ),
                       );
                     });
               }),
               SizedBox(
                 height: 5,
               ),
               dropdownQuestion(
                   controller.currentLoanTypeValue, controller.loanTypeList),
               SizedBox(
                 height: 15,
               ),
               //Q7
               StatementQuestion("Wie lang ist Deine Zinsbindung?", () {}),
               SizedBox(
                 height: 5,
               ),
               dropdownQuestion(controller.currentQ7Value, controller.q7list),
               SizedBox(
                 height: 10,
               ),
               //Q8
               Text(
                 "Wie hoch sind Deine Zinsen?",
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
               dropdownQuestion(controller.singleLoanPercentCurrent, controller.singleLoantPercentageList),
               SizedBox(
                 height: 10,
               ),
               //Q9
               Text(
                 "Wie hoch ist das Darlehen das Du in Anspruch genommen hast?",
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
               TextFormField(
                 controller: controller.question9C,
                 keyboardType: TextInputType.number,
                 validator: (v){
                   if(v == ""){
                     return "Please Ans This Question";
                   }
                 },
                 decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white,
                     border: OutlineInputBorder(),
                     hintText:
                     'Wie hoch ist das Darlehen das Du in Anspruch genommen hast',
                     hintStyle: TextStyle(fontSize: 12)),
               ),
               SizedBox(height: 5,),
               //10
               Text(
                 "Wie hoch ist die monatliche Rate (auch Annuität genannt)?",
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
               TextFormField(
                 controller: controller.question10C,
                 keyboardType: TextInputType.number,
                 validator: (v){
                   if(v == ""){
                     return "Please Ans This Question";
                   }
                 },
                 decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.white,
                     border: OutlineInputBorder(),
                     hintText:
                     'Wie hoch ist die monatliche Rate (auch Annuität genannt)',
                     hintStyle: TextStyle(fontSize: 12)),
               ),

             ],
           ):SizedBox()),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 1;
                    controller.percentage.value = 10;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.currentLoanValue.value == "Auswahl Monat und Jahr"){
                      if(controller.question5Date == null){
                        Fluttertoast.showToast(msg: "Enter Loan Date.");
                        return;
                      }
                      if(formPage2Key.currentState!.validate()){
                        SinglePropertyLoanModel singlePropertyLoanModel = SinglePropertyLoanModel(dateTime: controller.question5Date, loanType: controller.currentLoanTypeValue.value, interestRateDuration: controller.currentQ7Value.value, interestRatePercentage: controller.singleLoanPercentCurrent.value, loanAmount: double.parse(controller.question9C.text), monthlyPaymentAmount: double.parse(controller.question10C.text));
                        controller.singlePropertyLoanList.add(singlePropertyLoanModel);
                        print(controller.singlePropertyLoanList);
                        controller.activeIndex.value = 3;
                        controller.percentage.value = 50;
                      }
                      else{
                        return;
                      }
                    }
                    else{
                      Get.toNamed(Routes.SingleProperty);
                    }
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // 11
  Widget personalPage3(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eigennutzung",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //11
            Text(
              "Hast Du weitere Darlehen in Anspruch genommen?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            dropdownQuestion(controller.singleq11Current, controller.singleq11List),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 2;
                    controller.percentage.value = 30;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.singleq11Current.value == "Yes"){
                      controller.question5Date = null;
                      controller.question9C.text = "";
                      controller.question10C.text = "";
                      controller.activeIndex.value = 2;
                      controller.percentage.value = 30;
                    }
                    else{
                      Get.toNamed(Routes.SingleProperty);
                    }
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //4, 5, 6, 7
  Widget sharedPage1(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Anlage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //shared Q4
            StatementQuestion("Wann hast Du den Kaufvertrag unterschrieben?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "U.a. entscheidend für Die Spekulationssteuerfrist. Übrigens, wenn Du “bewegliche Extras“ wie z.B. Einbauküchen, Markisen, Photovoltaikanlagen, Saunen oder Gartenhäuser imKaufvertrag gesondert aufführst, musst Du auf diese Dinge womöglich keine Grunderwerbssteuer zahlen.Bei einer WEG wird auf Deinem erworbenen Anteil der Instandhaltungsrücklage ebenfalls keine Grundsteuer fällig. Sprich Deinen Notar direkt darauf an.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(
                controller.sharedQuestion4Value, controller.sharedQuestion4),
            Obx(() => controller.sharedQuestion4Value.value ==
                    "Auswahl Monat und Jahr"
                ? controller.buildDefaultSingleDatePickerWithValue("shared4")
                : SizedBox()),
            //Q5++++++++++++++++
            SizedBox(
              height: 10,
            ),
            StatementQuestion("Wann war das Übergabedatum?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Info: passender gesagt, wann war diese bezugsfertig d.h. wesentliche Bestandteile sind installiert, unwesentliche Restarbeiten sind unerheblich U.a. wichtig für Deine Abschreibung und Wartungsintervalle",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () async {
                BottomPicker.date(
                  title: 'Set Termination Date',
                  dateOrder: DatePickerDateOrder.dmy,
                  pickerTextStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                  onChange: (index) {},
                  onSubmit: (index) {
                    DateTime dateTime = index;
                    controller.q5date.value = dateTime;
                    print(controller.q5date);
                  },
                  bottomPickerTheme: BottomPickerTheme.plumPlate,
                ).show(context);
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Select Date",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Obx(() => DateTime(2006).compareTo(controller.q5date.value) == 1
                ? Column(
                    children: [
                      StatementQuestion(
                          "Hast Du Dich damals für eine degressive Immobilienabschreibung entschieden?",
                          () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                width: Get.width,
                                // height: 300,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(Icons.close)),
                                      ],
                                    ),
                                    Text(
                                      "Info: Seit dem 01.01.2006 können Immobilien nur Linear abgeschrieben werden. Solltest Du damals eine degressive Abschreibung gewählt haben, ist die Wahrscheinlichkeit hoch, dass Du mittlerweile von der geringen Abschreibungsmöglichkeit benachteiligt wirst. Sprich einmal Deinen Steuerberater darauf an. Nach Erbe oder Schenkung darfst Du die bisherige AfA in dem gleichen Umfang weiterführen. Mehr unter: (§ 11d EStDV). PS: Dies kann sich bei einer degressiven AfA (vor 2006) auch negativ auswirken.",
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              );
                            });
                      }),
                      dropdownQuestion(
                          controller.q5_1Current, controller.q5_1List),
                    ],
                  )
                : SizedBox()),

            SizedBox(
              height: 15,
            ),
            Obx(
              () => DateTime(2018).compareTo(controller.q5date.value) == -1 &&
                      DateTime(2021).compareTo(controller.q5date.value) == 1
                  ? Column(
                      children: [
                        StatementQuestion(
                            "Hast Du Dich für die Sonder-AfA (nach § 7b EstG.) entschieden?",
                            () {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                // <-- SEE HERE
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (context) {
                                return Container(
                                  width: Get.width,
                                  // height: 300,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(Icons.close)),
                                        ],
                                      ),
                                      Text(
                                        "Info: Für Neugeschaffenen Wohnraum konnten zwischen 2018 und 2021 eine „Sonder-AFA“ von zusätzlichen 5% in den ersten 4 Jahren gewährt werden. Dafür mussten allerdings einige Voraussetzung erfüllt sein. U.a. müssen Wohnungen min. 10 Jahren zu Wohnzwecken vermietet werden. Die Herstellungs- beziehungsweise Anschaffungskosten einschließlich Kaufnebenkosten dürfen 3.000 Euro je Quadratmeter nicht überschreiten. Für mehr Informationen siehe Paragraphen 7b EstG. Übrigens, sobald Du Hecken Büsche oder Bäume an den Grundstücksgrenzen zur „lebenden Umzäunung“ pflanzt, können diese zu den Herstellungskosten hinzugerechnet und somit abgeschrieben werden.",
                                        textAlign: TextAlign.justify,
                                      )
                                    ],
                                  ),
                                );
                              });
                        }),
                        dropdownQuestion(
                            controller.q5_2Current, controller.q5_2List),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
            StatementQuestion("Hast Du Wohnraum?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "z.b. durch Umnutzung oder Ausbau in Deiner Immobilie geschaffen und die Sonder-AfA für diesen Teil aktiviert?",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            dropdownQuestion(controller.q5_2_2Current, controller.q5_2_2List),
            SizedBox(
              height: 15,
            ),
            Obx(() => controller.q5_2_2Current.value == "Yes"
                ? TextField(
              controller: controller.sharequestion5TextC,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText:
                            'Wie hoch waren die Kosten für die Wohnraumschaffung',
                        hintStyle: TextStyle(fontSize: 14)),
                  )
                : SizedBox()),
            SizedBox(
              height: 20,
            ),
            //Q6+++++++++++++++++
            SizedBox(
              height: 15,
            ),
            StatementQuestion("Wohnst Du ebenfalls im Objekt?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Info: Übrigens: Sollte sich einmal die Nutzung der Flächen verändern, verlieren Sie für gewöhnlich nicht Ihre Abschreibungseigenschaften",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            dropdownQuestion(controller.q6Current, controller.q6List),
            SizedBox(
              height: 15,
            ),
            Obx(
                  () => controller.q6Current.value == "Yes"
                  ? TextField(
                controller: controller.shareq6TextC,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Wie Groß ist die Fläche die Du bewohnst?',
                    hintStyle: TextStyle(fontSize: 14)),
              )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15,
            ),
            //7+++++++++++++
            StatementQuestion(
                "Hast Du einen Betrieb im Objekt das zu Deinem Betriebsvermögen gehört?",
                    () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "In diesem Fall kann eine Höhere Abschreibung gewährt werden.",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
            dropdownQuestion(controller.q7Current, controller.q7List),
            Obx(
                  () => controller.q7Current.value == "Yes"
                  ? Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  StatementQuestion(
                      "Wurde der ursprüngliche Bauantrag für das Gebäude bzw. Ihrer Betriebsfläche nach 31.03.1985 gestellt? ",
                          () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return Container(
                                width: Get.width,
                                // height: 300,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(Icons.close)),
                                      ],
                                    ),
                                    Text(
                                      "In diesem Fall kann eine Höhere Abschreibung gewährt werden.",
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              );
                            });
                      }),
                  dropdownQuestion(
                      controller.q7_1Current, controller.q7_1List),
                ],
              )
                  : SizedBox(),
            ),
            Obx(() => controller.q7_1Current.value == "Yes"
                ? Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.sharedq7TextC1,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Wie groß ist die Fläche? ',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.sharedq7TextC2,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'Wie groß ist die Bruttogeschossfläche des Gebäudes?',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.sharedq7TextC3,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'Wieviel vermietete Nutzfläche hat Dein Objekt?',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ],
            )
                : SizedBox()),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 0;
                    controller.percentage.value = 0;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.sharedQuestion4Value.value == "Auswahl Monat und Jahr"){
                      if(controller.sharedquestion4DateTime == null){
                        Fluttertoast.showToast(msg: "Enter Date");
                        return;
                      }
                    }
                    if(controller.q5date.value == DateTime(1200)){
                      Fluttertoast.showToast(msg: "Enter Date");
                      return;
                    }
                    else{

                    }
                    if(controller.q5_2_2Current.value == "Yes"){
                      if(controller.sharequestion5TextC.text == ""){
                        Fluttertoast.showToast(msg: "All Fields Are Required.");
                        return;
                      }
                    }
                    if(controller.q6Current.value == "Yes"){
                      if(controller.shareq6TextC.text == ""){
                        Fluttertoast.showToast(msg: "All Fields Are Required.");
                        return;
                      }
                    }
                    if(controller.q7_1Current.value == "Yes"){
                      if(controller.sharedq7TextC1.text ==""  || controller.sharedq7TextC2.text =="" || controller.sharedq7TextC3.text ==""){
                      Fluttertoast.showToast(msg: "All Fields Are Required.");
                      return;
                      }
                    }
                    controller.activeIndex.value = 5;
                    controller.percentage.value = 30;
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //8, 9, 10, 11, 12, 13
  Widget sharedPage2(BuildContext context) {
    GlobalKey<FormState> sharedPropertyformPage2Key = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: sharedPropertyformPage2Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Anlage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Q8++++++++++
            StatementQuestion("Wann hast Du das Darlehen in Anspruch genommen?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            SizedBox(
              height: 5,
            ),
            dropdownQuestion(controller.q8Current, controller.q8List),
            Obx(() => controller.q8Current.value == "Auswahl Monat und Jahr"
                ? Column(
              children: [
                controller.buildDefaultSingleDatePickerWithValue("shared8"),
                //9
                StatementQuestion("Laufzeit bzw. Zinsbindung?",
                        () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              width: Get.width,
                              // height: 300,
                              padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close)),
                                    ],
                                  ),
                                  Text(
                                    "",
                                    textAlign: TextAlign.justify,
                                  )
                                ],
                              ),
                            );
                          });
                    }),
                SizedBox(
                  height: 5,
                ),
                dropdownQuestion(controller.q9Current, controller.q9List),
                SizedBox(
                  height: 15,
                ),
                // Q10++++++++++
                StatementQuestion("Zinshöhe?", () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.close)),
                                ],
                              ),
                              Text(
                                "",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        );
                      });
                }),
                dropdownQuestion(controller.q10Current, controller.q10List),
                SizedBox(
                  height: 20,
                ),
                // Q11++++++++++
                SizedBox(
                  height: 15,
                ),
                //11
                TextFormField(
                  controller: controller.sharedQ11TextC,
                  keyboardType: TextInputType.number,
                  validator: (v){
                    if(v == ""){
                      return "Please Enter This Field.";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Darlehenshöhe?',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 15,
                ),
                // Q12++++++++++
                TextFormField(
                  controller: controller.sharedQ12TextC,
                  keyboardType: TextInputType.number,
                  validator: (v){
                    if(v == ""){
                      return "Please Enter This Field.";
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                      'Wie hoch ist die monatliche Rate (auch Annuität genannt) dafür?',
                      hintStyle: TextStyle(fontSize: 14)),
                ),
                SizedBox(
                  height: 15,
                ),
                // Q13++++++++++
                StatementQuestion(
                    "Hast Du ein weiteres Darlehen für diese Immobilie aufgenommen?",
                        () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              width: Get.width,
                              // height: 300,
                              padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close)),
                                    ],
                                  ),
                                  Text(
                                    "",
                                    textAlign: TextAlign.justify,
                                  )
                                ],
                              ),
                            );
                          });
                    }),
                dropdownQuestion(controller.q13Current, controller.q13List),
              ],
            )
                : SizedBox()),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 4;
                    controller.percentage.value = 10;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.q8Current.value == "Auswahl Monat und Jahr"){
                      if(controller.sharedquestion8Date == null){
                        Fluttertoast.showToast(msg: "Enter Loan Date.");
                        return;
                      }
                      if(sharedPropertyformPage2Key.currentState!.validate()){
                        SharedPropertyLoanModel sharedPropertyLoanModel = SharedPropertyLoanModel(dateTime: controller.sharedquestion8Date, interestRateDuration: controller.q9Current.value,
                            interestRatePercentage: controller.q10Current.value, loanAmount: double.parse(controller.sharedQ11TextC.text),
                            monthlyPaymentAmount: double.parse(controller.sharedQ12TextC.text));
                        controller.sharedPropertyLoanList.add(sharedPropertyLoanModel);
                        print(controller.sharedPropertyLoanList);

                        if(controller.q13Current.value == "Yes"){
                          controller.sharedquestion8Date = null;
                          controller.sharedQ11TextC.text = "";
                          controller.sharedQ12TextC.text = "";
                          controller.q8Current.value = "kein Darlehen";
                        }
                        else{
                          controller.activeIndex.value = 6;
                          controller.percentage.value = 50;
                        }
                      }
                      else{
                        return;
                      }
                    }
                    else{
                      controller.activeIndex.value = 6;
                      controller.percentage.value = 50;
                      // Get.toNamed(Routes.SingleProperty);
                    }
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //14, 15, 16, 17
  Widget sharedPage3(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableProgress(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Anlage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),
            // Q14++++++++++
            StatementQuestion("Wie hoch war Dein eingebrachtes Eigenkapital?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Je geringer Dein eingebrachtes Eigenkapital, desto höher die Eigenkapitalrendite.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            TextField(
              controller: controller.sharedQ14TextC,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(

                  ),
                  hintText: 'Wie hoch war Dein eingebrachtes Eigenkapital?',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q15++++++++++
            StatementQuestion("Wie hoch ist die Jahresnettomiete?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "(auch Kaltmiete genannt, Miete ohne Nebenkosten (bei WEG: abzüglich Instandhaltungsrücklagen und Verwaltergebühren)",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            TextField(
              controller: controller.sharedQ15TextC,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie hoch ist die Jahresnettomiete?',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q16++++++++++
            StatementQuestion("Wie ist das Baujahr?", () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Das Baujahr entscheidet u.a. über Deine Nutzungsdauer und somit über die Abschreibungshöhe.",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            TextField(
              controller: controller.sharedQ16TextC,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie ist das Baujahr',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            SizedBox(
              height: 15,
            ),
            // Q17++++++++++
            StatementQuestion(
                "Hast Du die Immobilie einmal ausschließlich selber bewohnt?",
                () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: Get.width,
                      // height: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                          Text(
                            "Wir berechnen für Dich die Restnutzungsdauer Deines Objektes. Eventuell verändert sich hierdurch auch die Spekulationssteuerfrist Deines Objektes!",
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  });
            }),
            dropdownQuestion(controller.q17Current, controller.q17List),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => controller.q17Current.value == "Yes"
                  ? TextField(
                controller: controller.sharedQ17TextC,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Wie viele Jahre?',
                          hintStyle: TextStyle(fontSize: 14)),
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.activeIndex.value = 5;
                    controller.percentage.value = 30;
                  },
                  child: Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(controller.sharedQ14TextC.text == "" || controller.sharedQ15TextC.text == "" || controller.sharedQ16TextC.text == ""){
                      Fluttertoast.showToast(msg: "All Fields are Required.");
                      return;
                    }
                    if(controller.q17Current.value == "Yes"){
                      if(controller.sharedQ17TextC.text == ""){
                        Fluttertoast.showToast(msg: "All Fields are Required.");
                        return;
                      }
                    }
                    Get.toNamed(Routes.AnlageSingleProperty);
                  },
                  child: Text('Weiter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget PlantPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          reusableProgress(),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Plant",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => {
                    // DatePicker.showDatePicker(context,
                    //     showTitleActions: true,
                    //     currentTime: DateTime.now(),
                    //     locale: LocaleType.en)
                  },
                  child: Text(
                    "Wann hast Du den Kaufvertrag unterschrieben? (Auswahl Monat und Jahr oder Auswahlmöglichkeit: „Geschenkt / Geerbt“) Info: „U.a. entscheidend für Die Spekulationssteuerfrist.",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => {
                    // DatePicker.showDatePicker(context,
                    //     showTitleActions: true,
                    //     currentTime: DateTime.now(),
                    //     locale: LocaleType.en)
                  },
                  child: Text(
                    "Wann war das Übergabedatum (Beim Neubau: Wann war das Fertigstellungsdatum?) Auswahlmöglichkeit Monat / Jahr Info: passender gesagt, wann war diese bezugsfertig d.h. wesentliche Bestandteile sind installiert, unwesentliche Restarbeiten sind unerheblich U.a. wichtig für Deine Abschreibung und Wartungsintervalle",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Wohnst Du ebenfalls im Objekt?",
                  style: TextStyle(color: Colors.white),
                ),
                Obx(() => RadioListTile(
                      title: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: PropertyLive.yes,
                      groupValue: controller.propertycharacter.value,
                      onChanged: controller.handleSelection,
                    )),
                Obx(() => RadioListTile(
                      title: const Text(
                        'No',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: PropertyLive.no,
                      groupValue: controller.propertycharacter.value,
                      onChanged: controller.handleSelection,
                    )),
                if (controller.FieldVisible)
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText:
                          'Wenn ja: Wie Groß ist die Fläche die Du bewohnst? Flächenzahl Qm',
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.activeIndex--;
                  controller.percentage -= 10;
                },
                child: Text('Zurück'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.activeIndex++;
                  controller.percentage += 10;
                },
                child: Text('Weiter'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget PlantSubpage1(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          reusableProgress(),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Text(
                "Hast Du einen Betrieb im Objekt das zu Deinem Betriebsvermögen gehört?",
                style: TextStyle(color: Colors.white),
              ),
              Obx(() => RadioListTile(
                    title: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: BusinessAssets.yes,
                    groupValue: controller.businesscharacter.value,
                    onChanged: controller.handleBusinessSelection,
                  )),
              Obx(() => RadioListTile(
                    title: const Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: BusinessAssets.no,
                    groupValue: controller.businesscharacter.value,
                    onChanged: controller.handleBusinessSelection,
                  )),
              if (controller.BusinessFieldVisible)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wurde der ursprüngliche Bauantrag für das Gebäude bzw. Ihrer Betriebsfläche nach 31.03.1985 gestellt?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Obx(() => RadioListTile(
                          title: const Text('Yes'),
                          value: BusinessAssets.yes,
                          groupValue: controller.businesscharacter.value,
                          onChanged: controller.handleBusinessSelection,
                        )),
                    Obx(() => RadioListTile(
                          title: const Text('No'),
                          value: BusinessAssets.no,
                          groupValue: controller.businesscharacter.value,
                          onChanged: controller.handleBusinessSelection,
                        )),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Wie groß ist die Fläche? Flächenzahl Qm',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText:
                            'Wie groß ist die Bruttogeschossfläche des Gebäudes? Flächenzahl Qm',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText:
                            'Wieviel vermietete Nutzfläche hat Dein Objekt?',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => {
                        // DatePicker.showDatePicker(context,
                        //     showTitleActions: true,
                        //     currentTime: DateTime.now(),
                        //     locale: LocaleType.en)
                      },
                      child: Text(
                        "Wann hast Du das Darlehen in Anspruch genommen?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Laufzeit bzw. Zinsbindung?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: controller.currentSliderValue.value,
                      max: 100,
                      divisions: 4,
                      label: controller.currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        controller.currentSliderValue.value = value;
                      },
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.activeIndex--;
                  controller.percentage -= 10;
                },
                child: Text(
                  'Zurück',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.activeIndex++;
                  controller.percentage += 10;
                },
                child: Text('Weiter'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget PlantSubpage2(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          reusableProgress(),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Zinshöhe?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Darlehenshöhe?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText:
                      'Wie hoch ist die monatliche Rate (auch Annuität genannt) dafür?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Hast Du weitere Darlehen in Anspruch genommen?",
                style: TextStyle(color: Colors.white),
              ),
              ListTile(
                title: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Radio<PlantLoan>(
                  value: PlantLoan.yes,
                  groupValue: controller.plantloancharacter.value,
                  onChanged: (PlantLoan? value) {
                    controller.plantloancharacter.value = value!;
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'No',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Radio<PlantLoan>(
                  value: PlantLoan.no,
                  groupValue: controller.plantloancharacter.value,
                  onChanged: (PlantLoan? value) {
                    controller.plantloancharacter.value = value!;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.activeIndex--;
                  controller.percentage -= 10;
                },
                child: Text('Zurück'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.activeIndex++;
                  controller.percentage += 10;
                },
                child: Text('Weiter'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget PlantSubpage3(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          reusableProgress(),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie hoch war Dein eingebrachtes Eigenkapital?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie hoch ist die Jahresnettomiete?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Wie ist das Baujahr?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Wohnst Du ebenfalls im Objekt?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Obx(() => RadioListTile(
                    title: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: PropertyLived.yes,
                    groupValue: controller.propertylivedcharacter.value,
                    onChanged: controller.handlePropertySelection,
                  )),
              Obx(() => RadioListTile(
                    title: const Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: PropertyLived.no,
                    groupValue: controller.propertylivedcharacter.value,
                    onChanged: controller.handlePropertySelection,
                  )),
              if (controller.FieldVisible)
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Wie viele Jahre?',
                  ),
                ),
            ],
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (controller.q3Current.value == "Anlage") {
                Get.toNamed(Routes.AnlageSingleProperty);
              } else {
                Get.toNamed(Routes.SingleProperty);
              }
            },
            child: Text('Fertig'),
          ),
        ],
      ),
    );
  }

  Widget reusableProgress() {
    return CircularPercentIndicator(
      radius: 80.0, //radius for circle
      lineWidth: 15.0, //width of circle line
      animation: true, //animate when it shows progress indicator first
      percent: controller.percentage.value /
          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
      backgroundColor: Color.fromARGB(255, 205, 205, 205),
      progressColor: Color(0xff07f5d6),
      animationDuration: 500,
      center: Text(
        "${controller.percentage.value}%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  DateTime? openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set Termination Date',
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.blue,
      ),
      onChange: (index) {},
      onSubmit: (index) {
        DateTime dateTime = index;
        return dateTime;
        // controller.terminationdates.add(dateTime);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
}
