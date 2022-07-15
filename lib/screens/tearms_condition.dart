import 'package:alwaysvisa/components/custom_loader.dart';
import 'package:alwaysvisa/screens/inquarie_screen.dart';
import 'package:alwaysvisa/utils/constant.dart';
import 'package:alwaysvisa/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TearmsAndCondition extends StatefulWidget {
  const TearmsAndCondition({Key? key}) : super(key: key);

  @override
  State<TearmsAndCondition> createState() => _TearmsAndConditionState();
}

class _TearmsAndConditionState extends State<TearmsAndCondition> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLoading = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Condition'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(Constants.imageAssets('visaplane.jpg')),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: size.width / 2.2,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        UtilFunction.navigateTo(context, InqureScreen());
                      },
                      child: Text(
                        'Inquire Now',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                SizedBox(
                    width: size.width / 2.2,
                    height: 50,
                    child: isLoading
                        ? Custom_loader()
                        : ElevatedButton(
                            onPressed: () async {},
                            child: Text(
                              'Apply Now',
                              style: TextStyle(fontSize: 20),
                            ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
