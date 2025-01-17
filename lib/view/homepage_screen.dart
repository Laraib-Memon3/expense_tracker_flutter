import 'package:expense_tracker/controller/statemanagement/balance_visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Top gradient section
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff429690), Color(0xff2A7C76)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Good afternoon,",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const Text(
                              "Enjelin Morgeana",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.17),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Transactions History",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          ListTile(
                            leading: Image.asset(
                              'assets/images/upwork.png',
                              height: 30,
                              width: 30,
                            ),
                            title: const Text("Upwork"),
                            subtitle: const Text("Today"),
                            trailing: const Text(
                              "+\$850.00",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/transfer.png',
                              height: 30,
                              width: 30,
                            ),
                            title: const Text("Transfer"),
                            subtitle: const Text("Yesterday"),
                            trailing: const Text(
                              "-\$85.00",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/paypal.png',
                              height: 30,
                              width: 30,
                            ),
                            title: const Text("PayPal"),
                            subtitle: const Text("Jan 30, 2022"),
                            trailing: const Text(
                              "+\$1406.00",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/youtube.png',
                              height: 30,
                              width: 30,
                            ),
                            title: const Text("YouTube"),
                            subtitle: const Text("Jan 16, 2022"),
                            trailing: const Text(
                              "-\$11.99",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Send Again",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('See all',
                                  style: TextStyle(
                                      color: Color(0xff666666),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Image.asset('assets/images/transfer.png'),
                              Image.asset('assets/images/group12.png'),
                              Image.asset('assets/images/group13.png'),
                              Image.asset('assets/images/group14.png'),
                              Image.asset('assets/images/group15.png'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Floating card at the center, above both sections
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Card(
              color: const Color(0xff2F7E79),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                height: screenHeight * 0.27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Consumer<BalanceVisibilityProvider>(
                  builder: (context, visibilityProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Total Balance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    visibilityProvider.isVisible
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    visibilityProvider.toggleVisibility();
                                  },
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        if (visibilityProvider.isVisible)
                          Text(
                            "\$2,124.00",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white.withOpacity(0.15),
                                  child: const Icon(Icons.arrow_downward,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Income",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "\$1,840.00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white.withOpacity(0.15),
                                  child: const Icon(Icons.arrow_upward,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Expense",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "\$284.00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
                  }
              ),
            ),
          ),
          ),
        ],
      ),

    );
  }
}


