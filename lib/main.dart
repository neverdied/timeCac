import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sample App',
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({Key? key}) : super(key: key);

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {

  static DateTime _startTime=new DateTime(1999,10,10);
  static DateTime _endTime=new DateTime(1999,10,10);
  var difference;
  static String s="default";
  static DateTime now=DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("DatePicker"),),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [


          Text("开始时间"),
          _cupertinoDatePicker(CupertinoDatePickerMode.dateAndTime,0),
          Text("结束时间"),
          _cupertinoDatePicker(CupertinoDatePickerMode.dateAndTime,1),
          RaisedButton(
            child: Text("计算时间差"),
            onPressed: (){
              cac();
            },
          ),
          Text("时间差为："+s),
        ],
      ),
    );
  }

  Container _cupertinoDatePicker(CupertinoDatePickerMode mode,int flag){
    return Container(
      height: 200,
      child: CupertinoDatePicker(
        mode: mode, // 展示模式, 默认为 dateAndTime
        initialDateTime: DateTime(2020, 10, 10), // 默认选中日期
        minimumDate: DateTime(2020, 10, 10), // 最小可选日期
        maximumDate: DateTime(2021, 10, 10), // 最大可选日期


        minimumYear: 2020, // 最小可选年份
        maximumYear: 2021, // 最大可选年份

        minuteInterval: 10, // 分钟间隔

        use24hFormat: true, // 是否采用24小时制
        backgroundColor: Colors.cyan, // 背景色

        onDateTimeChanged: (dayTime){
          if(flag==0){
            this.setState(() {
              _startTime=dayTime;
            });
          }else{
            this.setState(() {
              _endTime=dayTime;

            });
          }
          print("onDateTimeChanged $dayTime");
        },
      ),
    );
  }

  void cac(){
    print(_startTime.toString()+"--"+_endTime.toString()+"=="+difference.toString());
    this.setState(() {
      difference=_endTime.difference(_startTime);
      s=difference.inDays.toString()+"天"+(difference.inHours-difference.inDays*24).toString()+"小时"+(difference.inMinutes-difference.inHours*60).toString()+"分钟";
      print([difference.inDays, difference.inHours,difference.inMinutes]);
    });
  }



}


