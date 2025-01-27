import 'package:incomeapp/controller/statemanagement/statistics_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});

  List<Color> gradientColors = [Color(0xff438883), Color(0xff438883)];

  bool showAvg = false;
  var value = 'Expense';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<StatisticsProvider>(context);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                  Text(
                    'Statistics',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/icons/statistic_download.svg',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<StatisticsProvider>(
                builder: (context, provider, child) {
                  final categories = ['Day', 'Week', 'Month', 'Year'];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categories.map((category) {
                      final isSelected = provider.selectedCategory == category;
                      return GestureDetector(
                        onTap: () {
                          provider.setSelectedCategory(category);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.003,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isSelected
                                ? const Color(0xff438883)
                                : Colors.transparent,
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xff666666),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff666666),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Consumer<StatisticsProvider>(
                      builder: (context, provider, child) {
                        return DropdownButton<String>(
                          value: provider.selectedValue,
                          items: ['Expense', 'Income'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 20,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              provider.setSelectedValue(newValue);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.45,
                    child: Padding(
                      padding: const EdgeInsets.only(),
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Spending',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                  ),
                  SvgPicture.asset(
                    'assets/images/icons/sendings.svg',
                  ),
                ],
              ),
              Column(
                children: [
                  Consumer<StatisticsProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.asset(
                              'assets/images/startbucks.png',
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              "Starbucks",
                              style: TextStyle(
                                color: provider.selectedTile == "Starbucks"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "Jan 16, 2022",
                              style: TextStyle(
                                color: provider.selectedTile == "Starbucks"
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                            trailing: Text(
                              "-\$150.00",
                              style: TextStyle(
                                color: provider.selectedTile == "Starbucks"
                                    ? Colors.white
                                    : Colors.red,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                            tileColor: provider.selectedTile == "Starbucks"
                                ? const Color(0xff29756F)
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              provider.setSelectedTile("Starbucks");
                            },
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/transfer.png',
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              "Transfer",
                              style: TextStyle(
                                color: provider.selectedTile == "Transfer"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "Yesterday",
                              style: TextStyle(
                                color: provider.selectedTile == "Transfer"
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                            trailing: Text(
                              "-\$85.00",
                              style: TextStyle(
                                color: provider.selectedTile == "Transfer"
                                    ? Colors.white
                                    : Colors.red,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                            tileColor: provider.selectedTile == "Transfer"
                                ? const Color(0xff29756F)
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              provider.setSelectedTile("Transfer");
                            },
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/youtube.png',
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              "YouTube",
                              style: TextStyle(
                                color: provider.selectedTile == "YouTube"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "Jan 16, 2022",
                              style: TextStyle(
                                color: provider.selectedTile == "YouTube"
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                            trailing: Text(
                              "-\$11.99",
                              style: TextStyle(
                                color: provider.selectedTile == "YouTube"
                                    ? Colors.white
                                    : Colors.red,
                                fontSize: 20,
                                fontFamily: 'Inter',
                              ),
                            ),
                            tileColor: provider.selectedTile == "YouTube"
                                ? const Color(0xff29756F)
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              provider.setSelectedTile("YouTube");
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? const Color(0xff438883) : Colors.transparent,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xff666666),
          fontSize: 18,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 3:
        text = const Text('MAR', style: style);
        break;
      case 4:
        text = const Text('APR', style: style);
        break;
      case 5:
        text = const Text('MAY', style: style);
        break;
      case 6:
        text = const Text('JUN', style: style);
        break;
      case 7:
        text = const Text('JUL', style: style);
        break;
      case 8:
        text = const Text('AUG', style: style);
        break;
      case 9:
        text = const Text('SEP', style: style);
        break;
      case 10:
        text = const Text('OCT', style: style);
        break;
      case 11:
        text = const Text('NOV', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBorder: BorderSide(
            color: Color(0xff43888399).withOpacity(0.6),
            width: 2,
          ),
          getTooltipColor: (spot) => Color(0xffF1F7F7).withOpacity(0.6),
          getTooltipItems: (List<LineBarSpot> spots) {
            return spots.map((spot) {
              return LineTooltipItem(
                '\$ ${spot.y.toString()}',
                const TextStyle(color: Color(0xff438883)),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 3,
      maxX: 9,
      minY: 0,
      maxY: 2000,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 700),
            FlSpot(2, 1600),
            FlSpot(3, 820),
            FlSpot(5, 1230),
            FlSpot(6, 1500),
            FlSpot(7, 1300),
            FlSpot(8, 1100),
            FlSpot(9, 1820),
            FlSpot(10, 1320),
            FlSpot(11, 1200),
            FlSpot(12, 2000),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  gradientColors[0].withOpacity(0.3),
                  Colors.white,
                ]),
          ),
        ),
      ],
    );
  }
}
