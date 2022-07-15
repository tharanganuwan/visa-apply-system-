import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/screens/home_screen.dart';
import 'package:alwaysvisa/screens/tearms_condition.dart';
import 'package:alwaysvisa/utils/app_colors.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VisaListScreen extends StatefulWidget {
  const VisaListScreen({Key? key}) : super(key: key);

  @override
  State<VisaListScreen> createState() => _VisaListScreenState();
}

class _VisaListScreenState extends State<VisaListScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Visa List'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                UtilFunction.navigateTo(context, HomeScreen());
              },
              icon: Icon(Icons.home)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For Germany',
                    image: 'germany.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For UK',
                    image: 'uk.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For Canada',
                    image: 'canada.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For France',
                    image: 'france.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For Belgium',
                    image: 'belgium.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For Australia',
                    image: 'australia.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For USA',
                    image: 'usa.jpg',
                    price: '4000-6000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For UAE',
                    image: 'uae.jpg',
                    price: '1500-5000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PackagesList(
                    size: size,
                    text: 'Document Package For Turkey',
                    image: 'uae.jpg',
                    price: '1500-5000 \u{20AC}',
                    ontap: () {
                      UtilFunction.navigateTo(context, TearmsAndCondition());
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class PackagesList extends StatelessWidget {
  const PackagesList(
      {Key? key,
      required this.size,
      required this.image,
      required this.price,
      required this.text,
      required this.ontap})
      : super(key: key);

  final Size size;
  final String image;
  final String text;
  final String price;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Stack(children: [
        Container(
          height: 130,
          width: size.width,
          decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Container(
                  color: kgreen,
                  child: Image.asset(
                    Constants.imageAssets(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: text,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  // CustomText(
                  //   text: " galley of type and scrambled  sss",
                  //   fontSize: 16,
                  // ),
                  // CustomText(
                  //   text: "United Arab Emirates",
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.bold,
                  //   textOverflow: TextOverflow.ellipsis,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 150),
                    child: Container(
                        height: 35,
                        width: 150,
                        color: korange,
                        alignment: Alignment.center,
                        child: CustomText(
                          text: price,
                          color: kwhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
