
import 'package:bmi/GenderSelectionWidget.dart';
import 'package:bmi/bmiresultscreen.dart';
import 'package:bmi/changebuttons.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BmiCalculatorScreen> {
  bool isMale = true;
  int weight = 0;
  int age = 0;
  double height=130;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bmi",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            fontSize: 53,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },
                child: GenderSelectionWidget(
                  width: width,
                  isMale: true,
                  backgroundColor: isMale ? cardColor : backgroundColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = false;
                  });
                },
                child: GenderSelectionWidget(
                  width: width,
                  isMale: false,
                  backgroundColor: !isMale ? cardColor : backgroundColor,
                ),
              ),
            ],
          ),

          Container(
            width: double.infinity,
            height: width*0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),color:cardColor
            ),
            child: Column(
              children: [
                Text('Height',style: TitleTextStyle,),
                Text('${height.toInt()}',style: TitleTextStyle.copyWith(fontSize: 50),),
              SliderTheme(
                data:SliderThemeData().copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: Colors.pinkAccent,
                  overlayColor: Colors.pink.withOpacity(0.5)
                ),
                  child: Slider(min:100,max:200,value: height,onChanged: (value){
                    height=value;
                    setState(() { });
                  }),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChangeButtons(
                  txt: "weight",
                  inc: weight,
                  width: width,
                  onAdd: () => addSubtractWeight(true),
                  onRemove: () => addSubtractWeight(false),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChangeButtons(
                  txt: "age",
                  inc: age,
                  width: width,
                  onAdd: () => addSubtractAge(true),
                  onRemove: () => addSubtractAge(false),
                ),
              ),
            ],
          ),
            
          GestureDetector(
            onTap: (){
              final bmi=weight/((height/100)*(height/100));
              print(bmi);

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BmiResultScreen(bmi: bmi,),),);
            },
            child: Container(
              height: 80,
              width: width,
              color: const Color.fromARGB(255, 231, 19, 90),
              child:Center(
                child: const Text(
                  "calculate Bmi",style: TitleTextStyle,
                ),
              ),
            ),
          )
        ],
        
      ),
    );
  }

  void addSubtractWeight(bool isAdd) {
    
     isAdd ? weight++ : weight<=0 ? weight :  weight--;
    setState(() {});
  }

  void addSubtractAge(bool isAdd) {
    
    isAdd ? age++ : age<=0 ? age : age--;
    setState(() {});
  }
}

