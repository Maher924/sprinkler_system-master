import 'package:flutter/material.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/weatherData.dart';

import '../../../utils/colors_palette.dart';
import '../../../utils/gaps.dart';
import '../../../widgets/custom_card.dart';

class TodaysAnalytic extends StatefulWidget {
  TodaysAnalytic({
    Key? key,
  }) : super(key: key);

  @override
  State<TodaysAnalytic> createState() => _TodaysAnalyticState();
}

class _TodaysAnalyticState extends State<TodaysAnalytic> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  color: ColorsPalette.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${WeatherData.date}',
                style: TextStyle(
                  color: ColorsPalette.primarySwatch.shade300,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Gaps.gap32,
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${WeatherData.temp}',
                    style: TextStyle(
                      color: ColorsPalette.primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '°C',
                    style: TextStyle(
                      color: ColorsPalette.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Gaps.gap16,
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Precip: '),
                      TextSpan(
                        text: '0%\n',
                        style: TextStyle(
                          color: ColorsPalette.primarySwatch,
                        ),
                      ),
                      TextSpan(text: 'Humidity:'),
                      TextSpan(
                        text: '${WeatherData.humidety}%\n',
                        style: TextStyle(
                          color: ColorsPalette.primarySwatch,
                        ),
                      ),
                      TextSpan(text: 'Wind: '),
                      TextSpan(
                        text: '${WeatherData.wind} km/h',
                        style: TextStyle(
                          color: ColorsPalette.primarySwatch,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      color: ColorsPalette.primarySwatch.shade300,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Gaps.gap16,
              Image.asset(
                AssetsManager.weather,
                width: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
