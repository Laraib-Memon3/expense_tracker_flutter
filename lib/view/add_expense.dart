import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final Map<String, String> _expenseIcons = {
    'Netflix': 'assets/images/netflix.png',
    'Shopping': 'assets/images/shopping.png',
    'Food': 'assets/images/food.png',
    'Transport': 'assets/images/transport.png',
    'Others': 'assets/images/others.png',
  };

  String? _selectedExpense;
  DateTime _selectedDate = DateTime.now();

  String _formatDate(DateTime date) {
    return DateFormat('EEE, dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildCard(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_semicircle.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildHeader(),
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
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Icon(Icons.more_horiz, size: 30, color: Colors.white),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.2,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Card(
        color: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              const SizedBox(height: 10),
              _buildDropdown(),
              const SizedBox(height: 15),
              const Text('Date'),
              const SizedBox(height: 10),
              _buildDateSelector(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _selectedExpense,
      hint: const Text('Select an expense category'),
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
        setState(() {
          _selectedExpense = newValue;
        });
      },
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffDDDDDD), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatDate(_selectedDate)),
            const Icon(Icons.calendar_today, color: Color(0xff666666)),
          ],
        ),
      ),
    );
  }
}
