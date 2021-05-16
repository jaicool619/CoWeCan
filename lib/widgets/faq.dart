
import 'package:CoWeCan/widgets/const.dart';
import 'package:CoWeCan/widgets/mainly.dart';
import 'package:CoWeCan/widgets/nav.dart';
import 'package:flutter/material.dart';


class FaqPage extends StatelessWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
    onTap: () { Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Nav()),
  ); },
    child: Icon(
      Icons.arrow_back, ) ),
        title: Text('FAQ❓🙋‍♂️'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          //for faq view
          title: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DataSource.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(DataSource.questionAnswers[index]['answer'])),
          ],
        ),
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}
