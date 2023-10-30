import 'package:flutter/material.dart';

class weightPage extends StatefulWidget {
  const weightPage({Key? key}) : super(key: key);

  @override
  State<weightPage> createState() => _weightPageState();
}

class _weightPageState extends State<weightPage> {
  String selectedUnit = 'Kilograms';
  String selectedUnit1 = 'Grams';
  double inputValue = 0.0;
  double result = 0.0;

  void convert() {
    // Converting input to common base unit
    if (selectedUnit == 'Kilograms' && selectedUnit1 == 'Grams') {
      result = inputValue * 1000;
    } else if (selectedUnit == 'Grams' && selectedUnit1 == 'Kilograms') {
      result = inputValue / 1000;
    } else if (selectedUnit == 'Kilograms' && selectedUnit1 == 'Pound') {
      result = inputValue * 2.20462;
    } else if (selectedUnit == 'Pound' && selectedUnit1 == 'Kilograms') {
      result = inputValue / 2.20462;
    } else if (selectedUnit == 'Grams' && selectedUnit1 == 'Pound') {
      result = inputValue * 0.00220462;
    } else if (selectedUnit == 'Pound' && selectedUnit1 == 'Grams') {
      result = inputValue / 0.00220462;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF314A69),
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width,
            decoration: const BoxDecoration(
              color: Color(0xffff3040),
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
               
              ),
            ),
            child:const Center( 
            child:  Padding(
              padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Text(
                'Weight',
                style: TextStyle(
                  fontSize: 60,
                  color: Color.fromARGB(255, 247, 247, 247),
                  fontWeight: FontWeight.w900,
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
                  color: Color.fromARGB(255, 249, 243, 59),
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
                      items: <String>['Kilograms', 'Grams', 'Pound']
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
            color: Colors.grey,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
              child: Text(
                'To',
                style: TextStyle(
                  fontSize: 27,
                  color: Color.fromARGB(255, 249, 243, 59),
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
                      items: <String>['Kilograms', 'Grams', 'Pound']
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
              color: Color(0xffff3040),
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
                    setState(() {});
                  },
                  child: const Text(
                    'Convert',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
