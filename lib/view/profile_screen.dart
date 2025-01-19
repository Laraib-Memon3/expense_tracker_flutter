import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                      // decoration: const BoxDecoration(
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: [Color(0xff429690), Color(0xff2A7C76)],
                      //   ),
                      //   borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(80),
                      //     bottomRight: Radius.circular(80),
                      //   ),
                      // ),
                      // image: DecorationImage(
                      //     image:
                      //         AssetImage('assets/images/background_semicircle.png'),
                      //     fit: BoxFit.cover,
                      //   ),
                      decoration: const BoxDecoration(
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
                          children: const [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              size: 30,
                              color: Colors.white,
                            ),
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

              // Bottom section for transactions
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.15,
                      ),
                      ListTile(
                          title: Text('Invite Friends'),
                          leading: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey[200],
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                      'assets/images/profile_icons/invite_friends.png')))),
                      Divider(),
                      ListTile(
                        title: Text('Account Info'),
                        leading: SvgPicture.asset(
                            'assets/images/profile_icons/account_info.svg'),
                      ),
                      ListTile(
                        title: Text('Personal Profile'),
                        leading: SvgPicture.asset(
                            'assets/images/profile_icons/personal_profile.svg'),
                      ),
                      ListTile(
                        title: Text('Message Center'),
                        leading: SvgPicture.asset(
                            'assets/images/profile_icons/message_center.svg'),
                      ),
                      ListTile(
                        title: Text('Login and Security'),
                        leading: SvgPicture.asset(
                            'assets/images/profile_icons/login_and_security.svg'),
                      ),
                      ListTile(
                        title: Text('Data and Privacy'),
                        leading: SvgPicture.asset(
                            'assets/images/profile_icons/data_and_privacy.svg'),
                      ),
                    ],
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
            child: Column(
              children: [
                Image.asset('assets/images/profile.png'),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text('Enjelin Morgeana',
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    )),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text('@enjelin_morgeana',
                    style: TextStyle(
                      color: Color(0xff438883),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
