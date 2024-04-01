import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/Utils/Constants/FooterWidget.dart';
import 'package:monimo/App/modules/Insurance/InsuranceController.dart';


class Insurance extends GetView<InsuranceController>{
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
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Image(image: AssetImage('assets/monlmo.png')),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Versicherungen",style: TextStyle(
                    fontSize: 16,
                  ),),
                  SizedBox(height: 10,),
                  Text("Unsere Eppfehlungen",style: TextStyle(
                    fontSize: 16,
                  )),
                  SizedBox(height: 10,),
                  reusableTextCard(context,"Home insurance 'Recommended'",
                      "Insured among others: fire, storm, hail, tap water, hail, storm, lightning strikes etc.Costs can be passed on to the tenants as ancillary costs.With WEG: This insurance is one of the compulsory insurances of a community of owners. For more information,speak to your manager."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"House and landowner liability 'Recommended'",
                      "Insures, among other things, the area of compulsory traffic safety. In other words, damage that third parties could incur.Costs can be passed on to the tenants as ancillary costs.With WEG: This insurance is also part of the compulsory insurance of a community of owners.Loss of rent insurance or nomadic rental insurance “makes sense in individual cases”You can deduct the costs as income-related expenses, they must not be passed on to the tenant"),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(
                      context,"Legal protection insurance or residential legal protection insurance 'recommended'",
                      "This protects you from the costs that a conflict with your tenants can entail.If you live in the same house as your tenants, you should definitely take out legal protection insurance.You can deduct the costs as income-related expenses, they may not be passed on to the tenant"),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Contents insurance should be rented out furnished, 'recommended'",
                      "You can deduct the costs as income-related expenses, which tenants are entitled towill not kill them.The insurance for your new construction or conversion measures."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"homeowners insurance; Fire shell insurance recommended",
                      "Homeowners insurance is recommended before you start construction. You already insure your shell or constructionsite against: fire, lightning, explosions, etc.You can deduct the costs as income-related expenses."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Builder's liability insurance recommended",
                      "Recommended for new builds or major renovations. Insured are, among other things, damage to third parties that may occur on the construction site.You can deduct the costs as income-related expenses."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Construction work insurance recommended",
                      "Insured against unforeseeable damage on the construction site. For example, subsidence, vandalism, collapse of neighboring buildings.You can deduct the costs as income-related expenses."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Statutory accident insurance for private construction workers recommended",
                      ""),
                  SizedBox(height: 30,),
                  footor(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Card reusableTextCard(BuildContext context,String text1, String text2) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              "${text1}",
              style: TextStyle(
                  color: Color(0xff4CB1A2),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              textAlign: TextAlign.center,
              "${text2}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}