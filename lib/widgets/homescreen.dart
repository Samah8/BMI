import'package:flutter/material.dart';
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>
with TickerProviderStateMixin{

int radioval=1;
double sliderval=50;
double sliderwe=4;
bool selected =false;
double  paddinglevel =0.0;
void onchange(){
  setState(() {
   paddinglevel=paddinglevel==0.0 ?50.0:30.0 ;
  });
}
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('BMI Calculator'),
        centerTitle: true,
        elevation: 8.2,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height:20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Select Your Type :-', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 24),),
          ),
          ListTile(
            title: Text("Male",style: TextStyle(color: Colors.white,fontSize: 20),),
          leading:Radio(
              value:2 ,
              groupValue: radioval,
              onChanged: (val){
                setState(() {
                  radioval=val;
                });
              },
            activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Female",style: TextStyle(color: Colors.white,fontSize: 20),),
            leading:Radio(
              value:1 ,
              groupValue: radioval,
              onChanged: (val){
                setState(() {
                 radioval= val;
                });
              },
              activeColor: Colors.green,

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Select Your Height :-', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 24),),
          ),
          Slider(
            value:sliderval ,
            min:30,
            max: 200,
            activeColor: Colors.green,
            inactiveColor: Colors.white70,
            divisions: 200,
            label: sliderval.round().toString(),
            onChanged:(double val){
             setState(() {
               sliderval=val;
             });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Select Your Weight :-', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 24),),
          ),
          Slider(
            value:sliderwe ,
            min:2,
            max: 200,
            activeColor: Colors.green,
            inactiveColor: Colors.white70,
            divisions: 200,
            label: sliderwe.round().toString(),
            onChanged:(double val){
              setState(() {
                sliderwe=val;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          AnimatedPadding(
            duration:Duration(seconds:3),
            padding: EdgeInsets.all(paddinglevel),
            child: GestureDetector(
              onTap:(){
                onchange();
                },
              child: Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                        offset: Offset(3,3),
                        blurRadius:5
                    )
                  ]
                ),

                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('height: $sliderval cm',style: TextStyle(fontSize: 18),),
                    ),
                    Text('weight: $sliderwe kg',style: TextStyle(fontSize: 18),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$radioval')
                  ],
                ),
              ),
            ),

          )  
        ],
      ),
    ),
  );


  }
}
