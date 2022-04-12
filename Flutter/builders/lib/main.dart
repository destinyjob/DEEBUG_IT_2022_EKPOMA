import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: StreamBuilderScreen(),
  ));
}


class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({Key? key}) : super(key: key);

  @override
  _StreamBuilderScreenState createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {

  List<int> num = [];
  // List<int> points = [];
  int points = 0;
  Stream myStream() async*{
    for(var i = 0; i < 100; i++){
      yield i;
      num.add(i);
      if(i == 30){
        setState(() {
          points + 11;
          print(num);
        });
      }else{
        num.clear();
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: StreamBuilder(
        stream: myStream(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              children: [
                Center(
                  child: num.length == 30 ? Text('I am in 30', style: TextStyle(fontSize: 40,
                  fontWeight: FontWeight.w700, color: Colors.blue),) : Text('${snapshot.data.toString()}', style: TextStyle(fontSize: 40,
                      fontWeight: FontWeight.w700, color: Colors.blue))
                ),

                Center(
                  child: Text('$points', style: TextStyle(fontSize: 40,
                  fontWeight: FontWeight.w700, color: Colors.blue),),
                ),
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        }
      )
    );
  }
}




class FutureBuilderScreen extends StatefulWidget {
  @override
  _FutureBuilderScreenState createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  ///FutureBuilder widget

  Future<String> getUserName() async{
    final String user = await Future.delayed(Duration(seconds: 10),(){
      return 'This is the end of todays class';
    });
    return user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getUserName(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      )
    );
  }
}



class check extends StatefulWidget {

  @override
  _checkState createState() => _checkState();
}

class _checkState extends State<check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async{
                var result = await Connectivity().checkConnectivity();
                if(result == ConnectivityResult.mobile) {
                  print("Internet connection is from Mobile data");
                }else if(result == ConnectivityResult.wifi) {
                  print("internet connection is from wifi");
                }else if(result == ConnectivityResult.ethernet){
                  print("internet connection is from wired cable");
                }else if(result == ConnectivityResult.bluetooth){
                  print("internet connection is from bluethooth threatening");
                }else if(result == ConnectivityResult.none){
                  print("No internet connection");
                }
              },
              child: Text('Enter'),
            ),
          )
        ],
      ),
    );
  }
}
