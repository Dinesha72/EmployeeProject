import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmployeeTable extends StatefulWidget {
  const EmployeeTable({super.key});

  @override
  EmployeeTableState createState() => EmployeeTableState();
}

class EmployeeTableState extends State<EmployeeTable> {
  List<Map<String, String>> employees = [
    {'s.no':'1','employee name': 'Ajith Kumar', 'mobile number': '9876543456', 'city': 'Kovilpatti', 'gender': 'male', 'work type': 'cleaning'},
    {'s.no':'2','employee name': 'vinai Kumar', 'mobile number': '9076543456', 'city': 'bangalore', 'gender': 'male', 'work type': 'cleaning'},
    {'s.no':'3','employee name': 'baby Kumar', 'mobile number': '9176543456', 'city': 'virdhunagar', 'gender': 'male', 'work type': 'mediccal'},
    {'s.no':'4','employee name': 'sathya Kumar', 'mobile number': '9876143456', 'city': 'chennai', 'gender': 'male', 'work type': 'cleaning'},
    {'s.no':'5','employee name': 'jk Kumar', 'mobile number': '9876542456', 'city': 'chennai', 'gender': 'male', 'work type': 'political'},
    {'s.no':'6','employee name': 'Kumar', 'mobile number': '9876540456', 'city': 'madurai', 'gender': 'male', 'work type': 'cleaning'},

    // Add more initial rows as needed
  ];
  var _result;
  var _result1;


  String dropdownvalue = 'cleaning';

  var items = [
    'cleaning',
    'marketing',
    'sale',
    'finance',
    'HR',
  ];

  void _deleteEmployee(int index) {
    setState(() {
      employees.removeAt(index);
    });
  }

  void _editEmployee(int index) {
    setState(() {
      employees.elementAt(index);
    });
  }

  void addEmployee(String index, String name, String mobile, String city,var gender,String workType) {
    setState(() {
      employees.add({
        's.no': index,
        'employee name': name,
        'mobile number': mobile,
        'city': city,
        'gender': gender,
        'work type': workType
      });
      debugPrint("The employees$employees");
    });
  }

  void _showAddEmployeeDialog() {
    // Initialize variables with empty strings
    String name = '', mobile = '', city = ''; String gender= "male";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context,setState) {
              return Padding(
                padding: EdgeInsets.fromLTRB(1050, 0, 0, 0),
                child: Container(
                  width: 447,
                  height: 818,
                  child: AlertDialog(
                    title: Text("Add New Employee"),
                    content: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 2),
                              Text(
                                "Employee Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 48,
                            width: 400,
                            child: TextField(
                              obscureText: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(''))
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your user name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 2),
                              Text(
                                "Mobile Number",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 48,
                            width: 400,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your mobile number',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  mobile = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 2),
                              Text(
                                "Location",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 48,
                            width: 400,
                            child: TextField(
                              obscureText: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your Location',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  city = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 2),
                              Text(
                                "Gender",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 150,
                                child: RadioListTile<String>(
                                  title: Text('Male'),
                                  value: 'male', // Set the value to "male"
                                  groupValue: gender, // This is the selected value
                                  onChanged: (String? value) {
                                    setState(() {
                                      gender = value!; // Update the gender variable
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 150,
                                child: RadioListTile<String>(
                                  title: Text('Female'),
                                  value: 'female', // Set the value to "female"
                                  groupValue: gender, // This is the selected value
                                  onChanged: (String? value) {
                                    setState(() {
                                      gender = value!; // Update the gender variable
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 2),
                              Text(
                                "Work Type",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 400,
                            height: 55,
                            child: DropdownButtonFormField(
                              value: dropdownvalue,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Container(
                          width: 120,
                          height: 36,
                          child: ElevatedButton(
                            child: Text("Cancel", style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.greenAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(
                                        color: Color.fromRGBO(31, 203, 79, 1)),
                                  )),
                            ),
                            onPressed: () {},
                          )),
                      Container(
                          width: 120,
                          height: 36,
                          child: ElevatedButton(
                            child: Text("Submit", style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Color.fromRGBO(31, 203, 79, 1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                          color: Color.fromRGBO(31, 203, 79, 1)),
                                    ))),
                            onPressed: () {
                              // Check if the name, mobile, and city are not empty before adding
                              if (name.isNotEmpty &&
                                  mobile.isNotEmpty &&
                                  city.isNotEmpty) {
                                addEmployee((employees.length + 1).toString(), name,
                                    mobile, city,gender,dropdownvalue);
                                Navigator.of(context).pop();
                              } else {
                                // Handle empty fields case if necessary
                                debugPrint("Please fill all the required fields");
                              }
                            },
                          ))
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              height:1000,
              width:266,
              color: Color.fromRGBO(29, 29, 65, 1),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(35,0,0,600),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Tech",
                        style: TextStyle(
                            fontSize: 27.76,
                            color: Colors.greenAccent
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lambdas",
                        style: TextStyle(
                          fontSize: 27.76,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Column(
            children: [
              SizedBox(height:30),
              Row(
                children: [
                  SizedBox(width: 30),
                  Container(
                    child: Text(
                      "Employee View",
                      style: TextStyle(
                        fontSize: 19.88,
                        color:Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: 1000),
                  Container(
                    child: IconButton(
                      icon: Icon(
                          Icons.notification_add_sharp
                      ), onPressed: () { },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Divider(
                thickness: 3,
                color: Colors.black,
                height: 12,
                indent: 21,
                endIndent: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30,0,500,0),
                    child: Container(
                        child:Text(
                          "Add Employee",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                    ),
                  ),
                  SizedBox(width: 450),
                  Container(
                      width: 120,
                      height: 36,
                      child: ElevatedButton(
                        child: Text(
                            "+ Add New",
                            style: TextStyle(fontSize: 14)
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(31, 203, 79, 1)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                  side: BorderSide(color: Color.fromRGBO(31, 203, 79, 1)),
                                )
                            )
                        ), onPressed: () {
                        _showAddEmployeeDialog();
                      },


                      )
                  )
                ],
              ),
              SizedBox(height:20),
              Padding(
                padding: EdgeInsets.fromLTRB(20,0,0,0),
                child: Container(
                  width: 1200,
                  height: 385,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('S.No')),
                      DataColumn(label: Text('Employee Name')),
                      DataColumn(label: Text('Mobile Number')),
                      DataColumn(label: Text('City')),
                      DataColumn(label: Text('Gender')),
                      DataColumn(label: Text('Work Type')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: employees
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      Map<String, String> employee = entry.value;
                      return DataRow(
                        cells: [
                          DataCell(Text(employee['s.no']!)),
                          DataCell(Text(employee['employee name']!)),
                          DataCell(Text(employee['mobile number']!)),
                          DataCell(Text(employee['city']!)),
                          DataCell(Text(employee['gender']!)),
                          DataCell(Text(employee['work type']!)),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit_note_outlined),
                                  onPressed: () {
                                    _editEmployee(index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    _deleteEmployee(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

