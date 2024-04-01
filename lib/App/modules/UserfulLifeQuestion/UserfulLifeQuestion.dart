import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../IntroQuestion/IntroQuestionWidget.dart';
import 'UserfulLifeQuestionController.dart';


class UsefulLifeQuestion extends GetView<UserfulLifeQuestionController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
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
                    Expanded(
                      child: Text(
                        "Useful life / amount of depreciation building AFA",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        showModalBottomSheet(context: context,
                            shape: const RoundedRectangleBorder( // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context){
                              return Container(
                                width: Get.width,
                                // height: 300,
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(onPressed: (){
                                            Get.back();
                                          }, icon: Icon(Icons.close)),
                                        ],
                                      ),
                                      Text("ATTENTION: From July 1st, 2023, new buildings can be depreciated at 3% instead of the previous 2%. From January 1st, 2023, it will no longer be possible to have a higher depreciation due to a shorter useful life confirmed by an expert. You can write off your rented property, here is more information about it: The year of manufacture determines your useful life. Models built after 1925 have a useful life of 50 years (depreciation rate 2% pa) Models built before 1925 have a useful life of 40 years (depreciation rate 2.5%). You can only depreciate your depreciation over the useful life... after that it can only be reactivated by a change of ownership. If you lived in your property yourself before renting it out, only your depreciation period will be reduced by these years, but not the amount. The formula is, self-use period - useful life : remaining useful life from the handover date. Commercial real estate usually has the same useful life as residential real estate, but this is part of your business assets and if the planning application was made after March 31, 1985, you can depreciate it with a useful life of 33 years, i.e. 3%. If the useful life of your building is actually shorter (e.g. in the case of a special construction or if the property is in a very bad condition), there is the possibility of reducing it. Discuss this with a real estate appraiser. Unfortunately, this option will no longer be available from January 1st, 2023. The building depreciation (AfA) begins with the month of handover or with the month of completion (more appropriately, when your property is ready for occupancy, ie essential components are installed, insignificant remaining work is irrelevant) and ends at the end of the useful life",textAlign: TextAlign.justify,)
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
                          color: Color(0xff76cce3)
                        ),
                        child: Icon(Icons.question_mark_outlined,size: 20,),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                SizedBox(
                  height: 10,
                ),
                // Q16++++++++++
                StatementQuestion("Wie ist das Baujahr?", (){
                  showModalBottomSheet(context: context,
                      shape: const RoundedRectangleBorder( // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context){
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    Get.back();
                                  }, icon: Icon(Icons.close)),
                                ],
                              ),
                              Text("Das Baujahr entscheidet u.a. über Deine Nutzungsdauer und somit über die Abschreibungshöhe.",textAlign: TextAlign.justify,)
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
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Q17++++++++++
                StatementQuestion("Hast Du die Immobilie einmal ausschließlich selber bewohnt?", (){
                  showModalBottomSheet(context: context,
                      shape: const RoundedRectangleBorder( // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context){
                        return Container(
                          width: Get.width,
                          // height: 300,
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    Get.back();
                                  }, icon: Icon(Icons.close)),
                                ],
                              ),
                              Text("Wir berechnen für Dich die Restnutzungsdauer Deines Objektes. Eventuell verändert sich hierdurch auch die Spekulationssteuerfrist Deines Objektes!",textAlign: TextAlign.justify,)
                            ],
                          ),
                        );
                      });
                }),
                dropdownQuestion(controller.q17Current,controller.q17List),
                SizedBox(
                  height: 5,
                ),
                Obx(() => controller.q17Current.value == "Yes"?TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Wie viele Jahre?',
                      hintStyle: TextStyle(
                          fontSize: 14
                      )
                  ),
                ):SizedBox()),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        // controller.activeIndex--;
                        // controller.percentage -= 10;

                      },
                      child: Text('Zurück'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // controller.activeIndex++;
                        // controller.percentage += 10;
                      },
                      child: Text('Weiter'),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void openDatePicker(BuildContext context) {
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
      onChange: (index) {
        print(index);
      },
      onSubmit: (index) {
        print(index);
        DateTime dateTime = index;
        // controller.terminationdates.add(dateTime);

      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }



  Widget reusableProgress() {
    return CircularPercentIndicator(
      radius: 80.0, //radius for circle
      lineWidth: 15.0, //width of circle line
      animation: true, //animate when it shows progress indicator first
      percent: controller.percentage.value / 100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
      backgroundColor: Color.fromARGB(255, 205, 205, 205),
      progressColor: Color(0xff07f5d6),
      animationDuration: 500,
      center: Text(
        "${controller.percentage.value}%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }


}