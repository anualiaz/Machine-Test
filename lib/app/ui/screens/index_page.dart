import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine_test/app/data/repository/employee_repository.dart';
import 'package:machine_test/app/ui/screens/details_screen.dart';


class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  late List<dynamic> detailsList;

  @override
  void initState() {
    EmployeeRepository().getEmployeeDetails().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee"),centerTitle: true,),
      body: Stack(
        children: [
          employeeList()
        ],
      ),
    );
  }

  Widget employeeList(){
    return Container(
      child: FutureBuilder(
        future: EmployeeRepository().getEmployeeDetails(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            detailsList = snapshot.data;
            return Container(
              child: ListView.builder(
                itemCount: detailsList.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: detailsList[index]['profile_image'] != null ? NetworkImage(detailsList[index]['profile_image'])
                        : NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png"),
                    ),
                    title: Text(detailsList[index]['name']),
                    subtitle: Text( detailsList[index]['company'] !=null ?detailsList[index]['company']['name'] : ""),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => EmployeeDetailScreen( details: detailsList[index],)
                      ),);
                    },
                  );
                }
              )
            );
          }else{
            return Center(
              child: Text("hdfvb"),
            );
          }
        },

      ),
    );
  }
}

