import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monimo/App/Utils/Constants/FooterWidget.dart';
import 'package:monimo/App/modules/EignennutzungInsurance/EignennutzungInsuranceController.dart';


class EignennutzungInsurance extends GetView<EignennutzungInsuranceController>{
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
                Get.back();
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
                      "Insured among others: fire, storm, hail, tap water, hail, storm, lightning strikes etc."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"House and landowner liability 'Recommended'",
                    "Insures, among other things, the area of compulsory traffic safety. In other words, damage that third parties could incur."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(
                      context,"Water damage or heating oil tank insurance",
                      "If you have a heating oil tank, absolutely 'recommended' Because if heating oil should leak out of your tank despite maintenance, you are still liable for the damage!"),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Insurance cover for administrative advisory boards 'If you live in a WEG, absolutely recommendable'",
                      "Damage caused by the administrative advisory board is hereby secured."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Household contents insurance recommended",
                      "In addition to fire, storm and water damage, it is ideal for protecting against burglary. We recommend to insure grossnegligence"),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"“Neutral” term life insurance",
                      "A term life insurance in the amount of the loan amount as protection for your surviving dependents, for example, should be considered by everyone."),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextCard(context,"Disability insurance Neutra",
                      "Disability insurance, also this insurance should be considered similar to term life insurance."),
                  SizedBox(
                    height: 10,
                  ),
                  Text("The insurance for your new construction or conversion measures.",style: TextStyle(
                    fontSize: 21,
                    color: Color(0xff4CB1A2),
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  reusableTextCard(context,"Fire shell insurance = residential building insurance recommended",
                      "Insures your shell/construction site against: fire, lightning, explosions, etc."),
                  SizedBox(
                    height: 10,
                  ),
                  reusableTextCard(context,"Builder's liability insurance recommended",
                      "Recommended for new builds or major renovations. Damage to third parties that may occur on the construction site is insured."),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  reusableTextCard(context,"Construction insurance recommended",
                      "Insured against unforeseeable damage on the construction site. For example, subsidence, vandalism, collapse of neighboring buildings. Please find out before you sign up whether these things are not already insured with another insurance company"),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  reusableTextCard(context,"Statutory accident insurance for private construction workers recommended",
                      "If you are expecting private construction helpers (relatives and friends), they must be compulsorily insured with the responsible construction trade association."),
                  SizedBox(
                    height: 10,
                  ),
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