import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
              Expanded(child: Container(
                margin: EdgeInsets.all(16),
                constraints: BoxConstraints(
                    minHeight: 150,
                    minWidth: 100
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("10",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Last Digit Contest".toUpperCase())
                    ],
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
