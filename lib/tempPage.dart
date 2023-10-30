import 'package:flutter/material.dart';

class tempPage extends StatefulWidget {
  const tempPage({Key? key}) : super(key: key);

  @override
  State<tempPage> createState() => _tempPageState();
}

class _tempPageState extends State<tempPage> {
  String selectedUnit = 'Celsius';
  String selectedUnit1 = 'Fahrenheit';
  double inputValue = 0.0;
  double result = 0.0;

  void convert() {
    if (selectedUnit == 'Celsius' && selectedUnit1 == 'Fahrenheit') {
      result = (inputValue * 9 / 5) + 32;
    } else if (selectedUnit == 'Fahrenheit' && selectedUnit1 == 'Celsius') {
      result = (inputValue - 32) * 5 / 9;
    } else if (selectedUnit == 'Celsius' && selectedUnit1 == 'Kelvin') {
      result = inputValue + 273.15;
    } else if (selectedUnit == 'Kelvin' && selectedUnit1 == 'Celsius') {
      result = inputValue - 273.15;
    } else if (selectedUnit == 'Fahrenheit' && selectedUnit1 == 'Kelvin') {
      result = (inputValue - 32) * 5 / 9 + 273.15;
    } else if (selectedUnit == 'Kelvin' && selectedUnit1 == 'Fahrenheit') {
      result = (inputValue - 273.15) * 9 / 5 + 32;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF314A69),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xfffd5d2d),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                
                ),
              ),
              child:const Center( 
              child:  Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 55,
                    color: Color.fromARGB(255, 254, 254, 254),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(80, 20, 0, 0),
                child: Text(
                  'From',
                  style: TextStyle(
                    fontSize: 27,
                    color: Color.fromARGB(255, 231, 245, 37),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: DropdownButton<String>(
                        value: selectedUnit,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedUnit = newValue!;
                            convert();
                          });
                        },
                        items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        '|',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 1, 1),
                          fontSize: 45,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            // Handle the input value
                            if (double.tryParse(value) != null) {
                              inputValue = double.parse(value);
                              convert();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            const Icon(
              Icons.swap_vert,
              size: 68,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Text(
                  'To',
                  style: TextStyle(
                    fontSize: 27,
                    color: Color.fromARGB(255, 231, 245, 37),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: DropdownButton<String>(
                        value: selectedUnit1,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedUnit1 = newValue!;
                          });
                        },
                        items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        '|',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 45,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Text(
                          ' $result',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                color:  Color(0xfffd5d2d),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      convert();
                      setState(() {}); // Update the UI with the result
                    },
                    child: const Text(
                      'Convert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
