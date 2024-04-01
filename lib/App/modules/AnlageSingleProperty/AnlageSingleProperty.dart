import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monimo/App/Utils/Constants/AppTheme/AppTheme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../App Routes/Routes.dart';
import '../../Utils/Constants/FooterWidget.dart';
import 'AnlageSinglePropertyController.dart';



class AnlageSingleProperty extends GetView<AnlageSinglePropertyController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xff1d2133), Color(0xff4195af)],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffBDFAF0),
            leading: IconButton(
              onPressed: (){
                Get.offAllNamed(Routes.RootScreen,arguments: 0);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
                child: Image(image: AssetImage('assets/monlmo.png')),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text("Mustername + Hessen",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap:()async{
                                        XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if(image != null){
                                          File imgfile = File(image.path);
                                          print(imgfile.path);
                                        }
                                      },
                                      child: Image(
                                          image:
                                          AssetImage('assets/building.png')),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Get.toNamed(Routes.FinancingQuestion);
                                      },
                                      child: SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: SfCartesianChart(
                                            primaryXAxis: CategoryAxis(),
                                            primaryYAxis: NumericAxis(
                                                minimum: 0,
                                                maximum: 40,
                                                interval: 10),
                                            tooltipBehavior: TooltipBehavior(enable: true),
                                            series: <
                                                ChartSeries<ChartData, String>>[
                                              ColumnSeries<ChartData, String>(
                                                  dataSource: controller.data,
                                                  xValueMapper:
                                                      (ChartData data, _) =>
                                                  data.x,
                                                  yValueMapper:
                                                      (ChartData data, _) =>
                                                  data.y,
                                                  name: 'Gold',
                                                  color: Color.fromRGBO(
                                                      8, 142, 255, 1))
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          Get.toNamed(Routes.FinancingQuestion);
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Eigenkapitalrednite",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("9,65%",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("Mieteinnahmen",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("€ 20.577,23",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () => {
                                          Get.toNamed(Routes.MaintenanceQuestion)
                                        },
                                        child: Text("Nachste Wartung",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                      ),
                                      Text("24.04.2024",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.toNamed(Routes.SmokeDetector,arguments: "If you sell your property after the speculation tax period, you do not have to pay any taxes on your profits. If you have built a new property on a plot of land, the speculation tax period begins from the time the contract of sale for the property is signed. - In the case of donated or inherited property, the holding period of the previous owner is added. - Three-property rule: If you sell more than 3 properties in 5 years, this is no longer considered a private real estate trade, but may be considered commercial. In this case, other taxes are levied on the profit in addition to the speculation tax. - Undeveloped properties have a speculation tax period of 10 years. - If you also live in your property yourself, the speculation tax period for this part of the property is reduced to '3' years (note it is not 36 months, but: a full calendar year after the calendar year in which the purchase contract was signed as a deadline)  - Attention: If you dissolve a current real estate loan when selling, your bank may incur a “prepayment penalty”, please check this in advance. - If you have already repaid some loans with your property, lending on the current property could also bring the following advantages: There are no taxes on the loaned money 2. Most likely, your return on equity will increase.");
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Spekulations- Zeitraum",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("965",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed(Routes.FinancingQuestion);
                                        },
                                        child: Column(
                                          children: [
                                            Text("darlehensende",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("31.04.2032",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("Restdarlehen",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            Text("€ 732.334,34",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Icons.file_open_rounded,color: Colors.blueAccent,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.FinancingQuestion);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Zinsen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("1,8%",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Annualität",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("€ 7.345,20",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Tilgung",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("2,2%",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.FinancingQuestion);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Darlehensende",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("31.04.2032",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Restdarlehen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("€ 730.334,34",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Restnutzungsdauer",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text("48 Jahre/2%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Color(0xffB1B1B1), //color of divider
                                    width: 30, //width space of divider
                                    thickness: 1.5, //thickness of divier line
                                  ),
                                  Column(
                                    children: [
                                      Text("Abzahlung Geplant",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text("24.03.2038",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.DepreciationQuestion);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("Afa Betrag 2022",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("€ 26.567,-",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: Color(0xffB1B1B1), //color of divider
                                      width: 30, //width space of divider
                                      thickness: 1.5, //thickness of divier line
                                    ),
                                    Column(
                                      children: [
                                        Text("Versteuernde Differenzen",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        Text("€ 20.000,-",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  options(context),
                  SizedBox(
                    height: 20,
                  ),
                  footor(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget options(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ListTile(
              onTap: (){
                Get.toNamed(Routes.DepreciationQuestion);
              },
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option1.png"),
              ),
              title: Text('Abschreibungen'),
              subtitle: Text('(inkl. Denkmalschutz, Erbpacht'),
            ),
            ListTile(
              onTap: ()=> {
                Get.toNamed(Routes.InfoPage, arguments: "According to the principle of economic efficiency, you as a landlord should deal fairly with the operating costs and their contracts. We alsorecommend that you regularly check and consider the costs of, for example, basic suppliers with cheap alternatives. As soon as you have contractually agreed an advance payment for ancillary costs with your tenant, you must create an ancillary cost statement. This must be done by December 31st. of the following year to your tenant. If you miss this deadline, your entitlement to any additional payments will be forfeited. Of course, the refunds from your tenants do not expire. If your tenants discover an error in the bill, they have the right to object 12 months after receipt. The ancillary cost statement must comply with the legal requirements. Due to formal errors in the utility bill, the effectiveness expires, ie the tenant should simply ignore them In general, it should be logically understandable and contain the following: - Your name as the landlord or who created it - Your tenant's name and address - The billing period (maximum one year). If there is a change of tenant during the billing period, the usage period of the respective tenant.- Designation of the rental property (street, floor, location in the property)  - Listing of the individual costs (according to the catalog of costs from § 2 number 1 to 16 of the Operating Costs Ordinance or according to individual agreement in the rental agreement)  - Input of other operating costs (§ 2 number 17 BetrKV )  - The total costs of the respective type of operating costs as well as the allocation to the individual rental or commercial units in the property - Explanations of the allocation key (e.g. by residential units, by living space or number of people) - The ancillary costs share of the respective tenant - The ancillary costs prepayments already made by the tenant - This results in the costs incurred by the tenant less the advance payments made, an additional payment or a credit. Even if you do not necessarily have to attach any receipts to your statement, the tenant has the right to view them if necessary. The utility bill must be sent to your tenants in writing by post, email or fax. The ancillary costs you can pass on to the tenant are regulated in the Ordinance on Operating Costs (§ 2 BetrKV ) (without an agreement on ancillary costs in the rental agreement, the ancillary costs are already covered with the payment of the gross rent). Other ancillary costs may be listed under 'Other operating costs', such as cleaning the gutters (if there are many trees), maintenance of smoke detectors, maintenance and filling of fire extinguishers, cleaning of pumps in a pond or fountain, cleaning of the waste containers or light shafts, maintenance of alarm systems, maintenance of the lightning conductor, cleaning of roller shutters or glass roofs, costs for community facilities such as fitness rooms, swimming pools, saunas, costs for security guards or porters or costs for a drinking water analysis, etc. if these are precise and clearly comprehensible. Non-recoverable costs are basically maintenance and repair costs as well as administration costs (§ 1 Paragraph 2 BetrKV ). 'Vacancy costs' may not be passed on to other tenants by changing the allocation key. In general, the additional costs that arise in a vacant apartment are to be paid by the owner. These can be written off as income-related expenses in the same year. If you have a mixed-use property (residential and commercial), make sure that the tenants are not disadvantaged when using the same distribution key. heating costs As a landlord, you are obliged to record the proportional heat and hot water consumption of the individual tenants (§ 4 Paragraph 1 Heating Costs Ordinance). At least 50% of the costs of the central heating or hot water supply system are to be allocated to the individual tenants according to the consumption recorded. In general, your tenants have the right: - On the preparation of a utility bill Check the ancillary cost statement and lodge an objection by the end of the 12th month after delivery. - To request access to the invoices or receipts for the ancillary cost settlement. - On withdrawal of a balance within 30 days. - After the billing period has expired, to withhold the ongoing ancillary cost advance payments until you as the landlord have billed. - Reclaim the advance payment for ancillary costs if the tenancy has ended and you have not prepared the utility bill within the deadline. For your commercial space rental, you only have to create an ancillary cost statement, provided this has been agreed in the rental agreement. Furthermore, the corresponding ancillary costs must have been specified in the rental agreement in order to be able to bill them.")
              },
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option2.png"),
              ),
              title: Text('Nebenkosten \n- Abrechnung'),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(Routes.TerminationQuestion);
              },
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option3.png"),
              ),
              title: Text('Kündigungen/ \n Optionen'),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(Routes.InfoPage, arguments: "What you should know about rent increases: - A co-increase request may be sent at the earliest 12 months after moving in or the last rent increase. The rent increase can then be activated from the 15th month. - Cap limit: A rent increase may only increase by a maximum of 15% or 20% (depending on the region) in 3 years. - The upper limit of the rent is the comparative rent of your rent index in the region. - If you don't have a rent index, you can argue with 3 comparison properties, but rental databases or expert reports are also an option. - You must submit the request for a rent increase in text form (§ 558a BGB). - Furnished If you rent your apartment furnished, approx. 2% of the purchase costs of the furniture can be allocated to the rent. The rental price brake still applies. - Temporary rental contract: However, if you rent out a furnished apartment for a limited period of time (temporary rental contract up to 12 months), the rental price brake does not apply! Rent increases after modernization: Rent increases due to modernization according to (§ 559 BGB) are unaffected by the capping limit. Since January 1, 2019, you can pass on up to 8 percent of the modernization costs to the tenant.- However, there is a cap on the amount of the levy: In 6 years, just because of modernization measures,  the rent may not rise above €3/sqm or €2/sqm (depending on the initial rental price)  - Publicly funded modernizations may not be passed on to the tenant! In the case of modernizations that cost less than €10,000, 30% may not be passed on to the tenant as maintenance costs. Index rents (The rental price is linked to changes in the consumer price index, so it can theoretically alsofall) Destatis calculator can help to calculate the changes : https://www.destatis.de/DE/Themen/Wirtschaft/Preise/Verwachsenerpreisindex/Methods/ Internetprogramm.html Graduated rents (rent increases are already agreed in advance in the rental agreement in the form of staggered) In the case of graduated rents, the rent changes at the earliest every 12 months, but a rent brake cannot be avoided in this way. If there is no rental price brake in your region, the rental price scales may be more than 10% of the local comparative rent.A cap limit does not apply to graduated rents.Rent increases due to modernization are excluded here. Here you will be informed about rent increases. Particularities: Once a year, the user receives a notification Inform yourself ");
              },
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option4.png"),
              ),
              title: Text('Mieterhöhungen'),
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(Routes.RootScreen,arguments: 1);
              },
              child: ListTile(
                textColor: Color(0xff5db9ab),
                leading: Image(
                  image: AssetImage("assets/option5.png"),
                ),
                title: Text('Versicherungen'),
              ),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(Routes.IntroQuestion);
              },
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option6.png"),
              ),
              title: Text('Weitere Immobilien Eingeben'),
            ),
            ListTile(
              textColor: Color(0xff5db9ab),
              leading: Image(
                image: AssetImage("assets/option7.png"),
              ),
              title: Text('Night Mode'),
              trailing: Obx(() =>  Switch(
                value: controller.nighmodeValue.value,
                onChanged: controller.toggleModeSwitch,
                activeColor: Color(0xFF4DB2A3),
                inactiveTrackColor: Colors.grey,
              ),),
            ),
            InkWell(
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const IntroScreen()),
                // )
                Get.offAllNamed(Routes.IntroScreen)
              },
              child: ListTile(
                textColor: Color(0xff5db9ab),
                leading: Image(
                  image: AssetImage("assets/option8.png"),
                ),
                title: Text('Anmelden/Abmelden'),
            ),
            ),
            ListTile(
              textColor: Color(0xff5db9ab),
              onTap: ()=> {
                Get.toNamed(Routes.Leasehold)
              },
              title: Text('Leasehold'),
            ),
            ListTile(
              textColor: Color(0xff5db9ab),
              onTap: (){
                Get.toNamed(Routes.InfoPage,arguments: "This app does not constitute tax or legal advice. Please have your individual personal situation clarified by a lawyer and/or tax advisor. Other errors may have crept into the app, please check all information with a professional.");
                },
              title: Text('Imprint / Disclaimer'),
            ),
            ListTile(
              textColor: Color(0xff5db9ab),
              onTap: (){
                Get.toNamed(Routes.InfoPage,arguments: "Did you notice any mistakes? If you have any questions or would like to share more real estate tips, please send us a message! We look forward to checking every message that reaches us.");
                },
              title: Text('Help / Questions'),
            )
          ],
        ),
      ),
    );
  }

}