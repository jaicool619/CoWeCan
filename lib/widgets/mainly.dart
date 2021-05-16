
import 'package:CoWeCan/widgets/constant.dart';
import 'package:CoWeCan/widgets/counter.dart';
import 'package:CoWeCan/widgets/faq.dart';
import 'package:CoWeCan/widgets/info_screen.dart';
import 'package:CoWeCan/widgets/my_header.dart';
import 'package:CoWeCan/widgets/nav.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "CoWeCan!",
              textBottom: "All you need \nis stay at home.",
              offset: offset,
            ),InkWell(onTap: (){Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => InfoScreen()),
  );},
            child:Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Center(child: Text("Symtoms and Prevention",style: TextStyle(fontSize: 20,))),
            ),),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Become a Plasma Donor\n",
                              style: kTitleTextstyle,
                            ),
                            
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.bloodtype,color: Colors.red,)
                      
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                   child:Text('Through a blood donation process, this antibody-rich plasma can be collected from a recovered person, then transfused to a sick patient who is still fighting the virus. This provides a boost to the immune system of the sick patient and may help speed the recovery process.')
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Keep yourself Healthy",
                        style: kTitleTextstyle,
                      ),
                      Spacer(),
                      Icon(Icons.line_weight,color: Colors.orange,)
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Text('Stay fit to fight the virus, say medics.\n Take exercise unless you are unwell with the virus: ideally a brisk walk, cycle or jog. Strengthening and balance exercises are also recommended. App consist of proper yoga and exercise track.')
                    ),
                  
                  SizedBox(height:20),
                   InkWell(onTap: (){Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => FaqPage()),
  );},
                                        child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Center(child: Text("FAQs",style: TextStyle(fontSize: 20,))),),
                   ),
              SizedBox(height:20)
            
           
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}