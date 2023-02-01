import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  String? time;
  String? date;

  //This function for Time Pick
  timePick(context)async{
    final timePicker = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    setState(() {
      time = timePicker?.format(context);
    });
  }

  //This function for Date Pick
  datePick(context)async{
    final datePicker  = await showDatePicker(
        context: context,
        initialDate: DateTime(2022),
        firstDate: DateTime(2001),
        lastDate: DateTime(2025),
    );
    setState(() {
      date = "${datePicker?.day}-${datePicker?.month}-${datePicker?.year}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Date And Time Picker"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Time : $time"),
              const SizedBox(height: 10.0,),
              Text("Date : $date"),
              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      timePick(context);
                    },
                    child: const Icon(Icons.access_time,color: Colors.white,),),
                  const SizedBox(width: 10.0,),
                  FloatingActionButton(
                    onPressed: (){
                      datePick(context);
                    },
                    child: const Icon(Icons.date_range_rounded,color: Colors.white,),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

