import 'package:alwaysvisa/components/custom_text.dart';
import 'package:alwaysvisa/screens/home_screen.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Container(
                height: 150,
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
                      width: 100,
                      height: 140,
                      child: Container(
                        color: kgreen,
                        child: Image.asset(
                          Constants.imageAssets(
                            'logo.jpg',
                          ),
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
                        CustomText(
                          text: "Tuarist Visa-30 Days sgl Entry",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: " galley of type and scrambled  sss",
                          fontSize: 16,
                        ),
                        CustomText(
                          text: "United Arab Emirates",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 35,
                            width: 90,
                            color: korange,
                            alignment: Alignment.center,
                            child: CustomText(
                              text: '319 AED',
                              color: kwhite,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
