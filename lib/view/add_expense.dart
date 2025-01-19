import 'package:expense_tracker/controller/statemanagement/add_expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({super.key});

  final Map<String, String> _expenseIcons = {
    'Netflix': 'assets/images/netflix.png',
    'Shopping': 'assets/images/netflix.png',
    'Food': 'assets/images/netflix.png',
    'Transport': 'assets/images/netflix.png',
    'Others': 'assets/images/netflix.png',
  };

  String _formatDate(DateTime date) {
    return DateFormat('EEE, dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.topCenter,
                        //   end: Alignment.bottomCenter,
                        //   colors: [Color(0xff429690), Color(0xff2A7C76)],
                        // ),
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(40),
                        //   bottomRight: Radius.circular(40),
                        // ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/background_semicircle.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const Text(
                              'Add Expense',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Icon(Icons.more_horiz,
                                size: 30, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset(
                        'assets/images/overlapping_cirlces.svg',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(color: Colors.white),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: screenHeight * 0.56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Consumer<AddExpenseProvider>(
                  builder: (context, provider, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xffDDDDDD), width: 2),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: provider.selectedExpense,
                          items: _expenseIcons.keys.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Image.asset(
                                    _expenseIcons[value]!,
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(value),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            provider.setSelectedExpense(newValue!);
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Amount',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff438883),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff438883),
                              fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(
                            Icons.attach_money,
                            color: Color(0xff438883),
                          ),
                          suffix: Text('Clear',
                              style: TextStyle(color: const Color(0xff438883))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff438883), width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color(0xff438883), width: 2),
                          ),
                          hintText: 'Enter amount',
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Date',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: provider.selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            provider.setSelectedDate(pickedDate);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xffDDDDDD), width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDate(provider.selectedDate),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(Icons.calendar_today,
                                  color: Color(0xff666666)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Invoice',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xffDDDDDD), width: 2),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_circle_outlined),
                              const SizedBox(width: 10),
                              const Text(
                                'Add invoice',
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
