import 'package:flutter/material.dart';
import 'package:machine_test/app/data/model/EmployeeModel.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final  details;

  EmployeeDetailScreen({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            employeeDetails(context)
          ],
        ),
      ),
    );
  }

  Widget employeeDetails(context){
    print(details);
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.yellow,
              backgroundImage:  details['profile_image'] != null ? NetworkImage(details['profile_image']):
              NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png"),
            ),
          ),
          SizedBox(height: 10,),
          Center(child: Text(details['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,),
          Text("Username: ", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width/1,
            height: 40,
            padding: const EdgeInsets.only(top: 10,left: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child:  Text(details['username'], style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
          Text("Email: ", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width/1,
            height: 40,
            padding: const EdgeInsets.only(top: 10,left: 20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Text(details['email'], style: TextStyle(fontWeight: FontWeight.bold),),
          ),
         SizedBox(height: 20,),
          Text("Address: ", style: TextStyle(fontSize: 15),),
         SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width/1,
            height: 70,
            padding: const EdgeInsets.only(top: 10,left: 20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${details['address']['street']},${details['address']['suite']},\n${details['address']['city']},${details['address']['zipcode']}", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Lat: ${details['address']['geo']['lat']},Long: ${details['address']['geo']['lng']} ", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text("Phone: ", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width/1,
            height: 40,
            padding: const EdgeInsets.only(top: 10,left: 20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Text(details['phone']!= null ?details['phone']: "Nill", style: TextStyle(fontWeight: FontWeight.bold),)
          ),
          SizedBox(height: 20,),
          Text("Website: ", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),
          Container(
              width: MediaQuery.of(context).size.width/1,
              height: 40,
              padding: const EdgeInsets.only(top: 10,left: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(details['website']!= null ?details['website']: "Nill", style: TextStyle(fontWeight: FontWeight.bold),)
          ),
          SizedBox(height: 20,),
          Text("Company: ", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width/1,
            height: 70,
            padding: const EdgeInsets.only(top: 10,left: 20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text("${details['company']['name']},\n${details['company']['catchPhrase']},\n ${details['company']['bs']}", style: TextStyle(fontWeight: FontWeight.bold),)
          ),
          SizedBox(height: 20,),
        ],
      )
    );
  }
}

/*
"company": {
      "name": "Considine-Lockman",
      "catchPhrase": "Synchronised bottom-line interface",
      "bs": "e-enable innovative applications"
    }
*/
