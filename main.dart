import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

// ============================================================
// DESIGN TOKENS — central place for the new visual language
// ============================================================
class AppColors {
  static const primary = Color(0xFF0B6FC9);
  static const primaryDark = Color(0xFF063E73);
  static const secondary = Color(0xFF14B8A6);
  static const accent = Color(0xFFFFB020);
  static const surfaceLight = Color(0xFFF6F8FC);
  static const surfaceDark = Color(0xFF0B1220);
  static const cardDark = Color(0xFF17233A);
}

extension CrowdLevelPalette on CrowdLevel {
  // Slightly richer, more saturated palette than the stock Material colors.
  Color get vividColor {
    switch (this) {
      case CrowdLevel.low:
        return const Color(0xFF17A672);
      case CrowdLevel.moderate:
        return const Color(0xFFF59E0B);
      case CrowdLevel.high:
        return const Color(0xFFE8590C);
      case CrowdLevel.extreme:
        return const Color(0xFFE0324A);
    }
  }
}

/// Reusable soft shadow so every card in the app feels consistent.
List<BoxShadow> softShadow({double opacity = 0.08, double blur = 24, Offset offset = const Offset(0, 10)}) => [
      BoxShadow(color: Colors.black.withOpacity(opacity), blurRadius: blur, offset: offset),
    ];

/// Small pill-shaped badge used across cards (crowd level, ratings, tags).
class Pill extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;
  final Color? textColor;
  final double fontSize;
  const Pill({super.key, this.icon, required this.text, required this.color, this.textColor, this.fontSize = 11});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: fontSize + 3, color: textColor ?? color),
            const SizedBox(width: 4),
          ],
          Text(text, style: TextStyle(color: textColor ?? color, fontSize: fontSize, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

/// Decorative soft blurred circle used to add depth to gradient hero cards.
class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;
  const _GlowCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.18)),
    );
  }
}

// Enum for Crowd Levels
enum CrowdLevel { low, moderate, high, extreme }

extension CrowdLevelExtension on CrowdLevel {
  String get label {
    switch (this) {
      case CrowdLevel.low:
        return 'Low Crowd';
      case CrowdLevel.moderate:
        return 'Moderate Crowd';
      case CrowdLevel.high:
        return 'High Crowd';
      case CrowdLevel.extreme:
        return 'Extremely Crowded';
    }
  }

  Color get color {
    switch (this) {
      case CrowdLevel.low:
        return Colors.green;
      case CrowdLevel.moderate:
        return Colors.orange;
      case CrowdLevel.high:
        return Colors.deepOrange;
      case CrowdLevel.extreme:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case CrowdLevel.low:
        return Icons.sentiment_very_satisfied;
      case CrowdLevel.moderate:
        return Icons.sentiment_satisfied;
      case CrowdLevel.high:
        return Icons.sentiment_dissatisfied;
      case CrowdLevel.extreme:
        return Icons.warning_amber_rounded;
    }
  }
}

// Destination Model
class Destination {
  final String id;
  final String name;
  final String location;
  final String category;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final String description;
  final CrowdLevel crowdLevel;
  final int crowdPercentage;
  final String bestTime;
  final double approxCost;
  final double distanceKm;
  final double lat;
  final double lng;
  final List<String> highlights;
  final String crowdAdvice;

  const Destination({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.description,
    required this.crowdLevel,
    required this.crowdPercentage,
    required this.bestTime,
    required this.approxCost,
    required this.distanceKm,
    required this.lat,
    required this.lng,
    required this.highlights,
    required this.crowdAdvice,
  });
}

// Crowd Hourly Prediction Model
class CrowdPrediction {
  final String timeLabel;
  final int hour;
  final CrowdLevel level;
  final int percentage;

  const CrowdPrediction({
    required this.timeLabel,
    required this.hour,
    required this.level,
    required this.percentage,
  });
}

// Trip Activity Item
class TripActivity {
  final String timeOfDay;
  final String title;
  final String description;
  final String category;
  final double approxCost;
  final String estimatedDuration;

  const TripActivity({
    required this.timeOfDay,
    required this.title,
    required this.description,
    required this.category,
    required this.approxCost,
    required this.estimatedDuration,
  });
}

// Day Itinerary
class DayItinerary {
  final int dayNumber;
  final String dayTitle;
  final List<TripActivity> activities;

  const DayItinerary({
    required this.dayNumber,
    required this.dayTitle,
    required this.activities,
  });
}

// Complete Trip Itinerary
class TripItinerary {
  final String id;
  final String destinationName;
  final int durationDays;
  final DateTime startDate;
  final double budgetUSD;
  final int travelersCount;
  final String travelPreference;
  final String travelPace;
  final double calculatedTotalCost;
  final List<DayItinerary> days;

  TripItinerary({
    required this.id,
    required this.destinationName,
    required this.durationDays,
    required this.startDate,
    required this.budgetUSD,
    required this.travelersCount,
    required this.travelPreference,
    required this.travelPace,
    required this.calculatedTotalCost,
    required this.days,
  });
}

// Real-Time Weather Data Model
class WeatherData {
  final String location;
  final int tempCelsius;
  final String condition;
  final IconData icon;
  final int humidity;
  final double windSpeedKm;
  final int uvIndex;
  final String travelAdvice;

  const WeatherData({
    required this.location,
    required this.tempCelsius,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeedKm,
    required this.uvIndex,
    required this.travelAdvice,
  });
}

// 7 Wonders Package Model
class SevenWondersPackage {
  final String title;
  final String tagline;
  final int totalDays;
  final double estimatedPrice;
  final List<Destination> wonders;

  const SevenWondersPackage({
    required this.title,
    required this.tagline,
    required this.totalDays,
    required this.estimatedPrice,
    required this.wonders,
  });
}

// Weather Service with Location Awareness
class WeatherService {
  static final Map<String, WeatherData> _weatherDataMap = {
    'Tirupati, AP': const WeatherData(
      location: 'Tirupati, AP',
      tempCelsius: 31,
      condition: 'Sunny & Warm',
      icon: Icons.wb_sunny_rounded,
      humidity: 58,
      windSpeedKm: 12.5,
      uvIndex: 7,
      travelAdvice: 'Ideal for morning shrine visits. Hydrate well.',
    ),
    'Visakhapatnam': const WeatherData(
      location: 'Visakhapatnam',
      tempCelsius: 29,
      condition: 'Coastal Breeze',
      icon: Icons.air_rounded,
      humidity: 72,
      windSpeedKm: 18.0,
      uvIndex: 6,
      travelAdvice: 'Pleasant beach weather. Great for evening strolls.',
    ),
    'Araku Valley': const WeatherData(
      location: 'Araku Valley',
      tempCelsius: 22,
      condition: 'Mist & Cool',
      icon: Icons.cloud_queue_rounded,
      humidity: 80,
      windSpeedKm: 8.4,
      uvIndex: 4,
      travelAdvice: 'Perfect for coffee plantation tours & valley treks.',
    ),
    'Hyderabad': const WeatherData(
      location: 'Hyderabad',
      tempCelsius: 33,
      condition: 'Partly Cloudy',
      icon: Icons.wb_cloudy_rounded,
      humidity: 50,
      windSpeedKm: 14.2,
      uvIndex: 8,
      travelAdvice: 'Warm afternoon. Visit historical forts during evening.',
    ),
    'Taj Mahal, Agra': const WeatherData(
      location: 'Taj Mahal, Agra',
      tempCelsius: 28,
      condition: 'Clear Sky',
      icon: Icons.wb_sunny_outlined,
      humidity: 45,
      windSpeedKm: 10.0,
      uvIndex: 6,
      travelAdvice: 'Crisp sunrise lighting. Excellent photos before 9 AM.',
    ),
    'Great Wall, China': const WeatherData(
      location: 'Great Wall, China',
      tempCelsius: 18,
      condition: 'Breezy & Mild',
      icon: Icons.filter_drama_rounded,
      humidity: 40,
      windSpeedKm: 22.0,
      uvIndex: 5,
      travelAdvice: 'Wear windbreaker gear for ridge walks.',
    ),
    'Petra, Jordan': const WeatherData(
      location: 'Petra, Jordan',
      tempCelsius: 26,
      condition: 'Dry & Arid',
      icon: Icons.wb_sunny_rounded,
      humidity: 25,
      windSpeedKm: 11.0,
      uvIndex: 9,
      travelAdvice: 'High UV. Sunhat and protective sunglasses advised.',
    ),
    'Machu Picchu, Peru': const WeatherData(
      location: 'Machu Picchu, Peru',
      tempCelsius: 19,
      condition: 'Mountain Mist',
      icon: Icons.cloud_rounded,
      humidity: 78,
      windSpeedKm: 9.5,
      uvIndex: 6,
      travelAdvice: 'Sturdy hiking boots & waterproof jacket recommended.',
    ),
    'Christ the Redeemer, Brazil': const WeatherData(
      location: 'Christ the Redeemer, Brazil',
      tempCelsius: 27,
      condition: 'Tropical Sun',
      icon: Icons.wb_sunny_rounded,
      humidity: 68,
      windSpeedKm: 15.0,
      uvIndex: 8,
      travelAdvice: 'Clear panoramic views of Rio bay today.',
    ),
    'Colosseum, Rome': const WeatherData(
      location: 'Colosseum, Rome',
      tempCelsius: 24,
      condition: 'Pleasant Sun',
      icon: Icons.brightness_5_rounded,
      humidity: 52,
      windSpeedKm: 13.0,
      uvIndex: 5,
      travelAdvice: 'Comfortable temperature for outdoor forum exploration.',
    ),
    'Chichen Itza, Mexico': const WeatherData(
      location: 'Chichen Itza, Mexico',
      tempCelsius: 32,
      condition: 'Humid Heat',
      icon: Icons.thermostat_rounded,
      humidity: 75,
      windSpeedKm: 11.2,
      uvIndex: 9,
      travelAdvice: 'High heat index. Visit pyramid early morning.',
    ),
  };

  static WeatherData getWeatherForLocation(String location) {
    if (_weatherDataMap.containsKey(location)) {
      return _weatherDataMap[location]!;
    }
    return WeatherData(
      location: location,
      tempCelsius: 27,
      condition: 'Partly Sunny',
      icon: Icons.wb_cloudy_rounded,
      humidity: 55,
      windSpeedKm: 12.0,
      uvIndex: 6,
      travelAdvice: 'Good weather conditions for general sightseeing.',
    );
  }
}

// Repository of Mock Destinations including 7 Wonders
class DestinationRepository {
  static final List<Destination> allDestinations = [
    const Destination(
      id: 'w1',
      name: 'Taj Mahal',
      location: 'Agra, India',
      category: '7 Wonders',
      rating: 4.9,
      reviewCount: 124500,
      imageUrl: 'https://images.unsplash.com/photo-1564507592333-c60657eea523?auto=format&fit=crop&w=800&q=80',
      description: 'An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor Shah Jahan.',
      crowdLevel: CrowdLevel.extreme,
      crowdPercentage: 92,
      bestTime: '6:00 AM - 8:30 AM',
      approxCost: 15.0,
      distanceKm: 12.5,
      lat: 27.1751,
      lng: 78.0421,
      highlights: ['Sunrise Reflection Pool', 'Mughal Architecture', 'Marble Inlay Art'],
      crowdAdvice: 'Peak crowd at 11 AM. Arrive at 5:30 AM for quiet photo opportunities.',
    ),
    const Destination(
      id: 'w2',
      name: 'Great Wall of China',
      location: 'Huairou, China',
      category: '7 Wonders',
      rating: 4.8,
      reviewCount: 98200,
      imageUrl: 'https://images.unsplash.com/photo-1508804185872-d7badad00f7d?auto=format&fit=crop&w=800&q=80',
      description: 'A series of fortifications made of stone, brick, tamped earth, wood, and other materials running across historical northern borders.',
      crowdLevel: CrowdLevel.high,
      crowdPercentage: 78,
      bestTime: '3:00 PM - 5:30 PM',
      approxCost: 25.0,
      distanceKm: 45.0,
      lat: 40.4319,
      lng: 116.5704,
      highlights: ['Mutianyu Cable Car', 'Watchtowers', 'Panoramas'],
      crowdAdvice: 'Avoid Badaling section; opt for Mutianyu or Jinshanling for 40% less crowds.',
    ),
    const Destination(
      id: 'w3',
      name: 'Petra Archeological Park',
      location: 'Ma\'an, Jordan',
      category: '7 Wonders',
      rating: 4.9,
      reviewCount: 65400,
      imageUrl: 'https://images.unsplash.com/photo-1579606032822-19c96ef062be?auto=format&fit=crop&w=800&q=80',
      description: 'Famous rock-cut architecture and water conduit system carved into red sandstone cliffs by Nabataeans.',
      crowdLevel: CrowdLevel.moderate,
      crowdPercentage: 54,
      bestTime: '6:30 AM - 9:00 AM',
      approxCost: 70.0,
      distanceKm: 180.0,
      lat: 30.3285,
      lng: 35.4444,
      highlights: ['Al-Khazneh (Treasury)', 'Siq Gorge Canyon', 'Monastery Hike'],
      crowdAdvice: 'Comfortable crowd levels. Visit Monastery during mid-day.',
    ),
    const Destination(
      id: 'w4',
      name: 'Machu Picchu Sanctuary',
      location: 'Cusco, Peru',
      category: '7 Wonders',
      rating: 4.95,
      reviewCount: 88900,
      imageUrl: 'https://images.unsplash.com/photo-1526392060635-9d6019884377?auto=format&fit=crop&w=800&q=80',
      description: '15th-century Inca citadel located in the Eastern Cordillera of southern Peru on a 2,430-metre mountain ridge.',
      crowdLevel: CrowdLevel.high,
      crowdPercentage: 81,
      bestTime: '12:00 PM - 3:00 PM',
      approxCost: 65.0,
      distanceKm: 75.0,
      lat: -13.1631,
      lng: -72.5450,
      highlights: ['Intihuatana Stone', 'Sun Gate Ascent', 'Inca Terraces'],
      crowdAdvice: 'Afternoon slots (after 12 PM) have significantly shorter queues.',
    ),
    const Destination(
      id: 'w5',
      name: 'Christ the Redeemer',
      location: 'Rio de Janeiro, Brazil',
      category: '7 Wonders',
      rating: 4.85,
      reviewCount: 77100,
      imageUrl: 'https://images.unsplash.com/photo-1516306580123-e6e52b1b7b5f?auto=format&fit=crop&w=800&q=80',
      description: 'An Art Deco statue of Jesus Christ created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa.',
      crowdLevel: CrowdLevel.extreme,
      crowdPercentage: 89,
      bestTime: '8:00 AM - 9:30 AM',
      approxCost: 20.0,
      distanceKm: 8.0,
      lat: -22.9519,
      lng: -43.2105,
      highlights: ['Corcovado Mountain Railway', '360 Bay View', 'Tijuca Forest'],
      crowdAdvice: 'Book early morning Corcovado train to avoid 2-hour summit queues.',
    ),
    const Destination(
      id: 'w6',
      name: 'The Colosseum',
      location: 'Rome, Italy',
      category: '7 Wonders',
      rating: 4.8,
      reviewCount: 142000,
      imageUrl: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?auto=format&fit=crop&w=800&q=80',
      description: 'An oval amphitheatre in the centre of the city of Rome, the largest ancient amphitheatre ever built.',
      crowdLevel: CrowdLevel.high,
      crowdPercentage: 84,
      bestTime: '4:00 PM - 6:30 PM',
      approxCost: 22.0,
      distanceKm: 3.5,
      lat: 41.8902,
      lng: 12.4922,
      highlights: ['Arena Floor', 'Underground Tunnels', 'Roman Forum'],
      crowdAdvice: 'Late afternoon visits offer golden hour light and fewer tour buses.',
    ),
    const Destination(
      id: 'w7',
      name: 'Chichen Itza Pyramid',
      location: 'Yucatan, Mexico',
      category: '7 Wonders',
      rating: 4.75,
      reviewCount: 59300,
      imageUrl: 'https://images.unsplash.com/photo-1518638150340-f706e86654de?auto=format&fit=crop&w=800&q=80',
      description: 'A large pre-Columbian city built by the Maya people of the Terminal Classic period.',
      crowdLevel: CrowdLevel.moderate,
      crowdPercentage: 62,
      bestTime: '8:00 AM - 10:00 AM',
      approxCost: 30.0,
      distanceKm: 120.0,
      lat: 20.6843,
      lng: -88.5678,
      highlights: ['El Castillo Pyramid', 'Great Ball Court', 'Sacred Cenote'],
      crowdAdvice: 'Arrive right at opening time to tour the ruins before bus tours arrive at 11 AM.',
    ),
    const Destination(
      id: 'd1',
      name: 'Sri Venkateswara Swamy Temple',
      location: 'Tirupati, AP',
      category: 'Spiritual',
      rating: 4.9,
      reviewCount: 89000,
      imageUrl: 'https://images.unsplash.com/photo-1609766857041-ed402ea8069a?auto=format&fit=crop&w=800&q=80',
      description: 'World famous hilltop shrine dedicated to Lord Venkateswara surrounded by Seven Hills of Tirumala.',
      crowdLevel: CrowdLevel.extreme,
      crowdPercentage: 96,
      bestTime: 'After 7:30 PM or Early 4 AM',
      approxCost: 5.0,
      distanceKm: 2.1,
      lat: 13.6833,
      lng: 79.3500,
      highlights: ['Ananda Nilayam Gopuram', 'Laddu Prasadam', 'Silathoranam Hike'],
      crowdAdvice: 'Current wait times exceed 4 hours. Consider Kapila Theertham as a quiet alternative today.',
    ),
    const Destination(
      id: 'd2',
      name: 'Kapila Theertham Waterfalls',
      location: 'Tirupati, AP',
      category: 'Nature & Temple',
      rating: 4.6,
      reviewCount: 14200,
      imageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=800&q=80',
      description: 'A serene ancient Shiva temple located at the foot of Kapila Theertham waterfall and green mountain rocks.',
      crowdLevel: CrowdLevel.low,
      crowdPercentage: 28,
      bestTime: '9:00 AM - 12:00 PM',
      approxCost: 0.0,
      distanceKm: 4.5,
      lat: 13.6521,
      lng: 79.4211,
      highlights: ['Natural Waterfall', 'Mountain Caves', 'Tranquil Courtyard'],
      crowdAdvice: 'Highly recommended quiet alternative near main Tirupati region.',
    ),
    const Destination(
      id: 'd3',
      name: 'Rk Beach & Submarine Museum',
      location: 'Visakhapatnam',
      category: 'Beaches',
      rating: 4.7,
      reviewCount: 31000,
      imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
      description: 'Iconic urban promenade beach with INS Kursura Submarine Museum preserved on sand.',
      crowdLevel: CrowdLevel.moderate,
      crowdPercentage: 58,
      bestTime: '5:00 PM - 7:30 PM',
      approxCost: 3.0,
      distanceKm: 6.2,
      lat: 17.7101,
      lng: 83.3163,
      highlights: ['Real Decommissioned Submarine', 'Coastal Walkway', 'Seafood Stalls'],
      crowdAdvice: 'Moderate weekend stroll crowds. Rush picks up after sunset.',
    ),
    const Destination(
      id: 'd4',
      name: 'Borra Caves & Coffee Plantations',
      location: 'Araku Valley',
      category: 'Nature & Adventure',
      rating: 4.8,
      reviewCount: 22400,
      imageUrl: 'https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=800&q=80',
      description: 'Million-year-old limestone caves featuring naturally formed speleothems lit with vibrant colors.',
      crowdLevel: CrowdLevel.low,
      crowdPercentage: 35,
      bestTime: '10:00 AM - 2:00 PM',
      approxCost: 4.0,
      distanceKm: 18.0,
      lat: 18.2811,
      lng: 83.0388,
      highlights: ['Speleothem Formations', 'Gosthani Riverbed', 'Organic Coffee Tastings'],
      crowdAdvice: 'Ideal quiet escape. Low crowd density today.',
    ),
    const Destination(
      id: 'd5',
      name: 'Charminar & Laad Bazaar',
      location: 'Hyderabad',
      category: 'Historical',
      rating: 4.6,
      reviewCount: 67000,
      imageUrl: 'https://images.unsplash.com/photo-1589308078059-be1415eab4c3?auto=format&fit=crop&w=800&q=80',
      description: '16th-century mosque with four grand arches and vibrant heritage bangle market surroundings.',
      crowdLevel: CrowdLevel.high,
      crowdPercentage: 82,
      bestTime: '8:00 AM - 10:00 AM',
      approxCost: 2.0,
      distanceKm: 1.5,
      lat: 17.3616,
      lng: 78.4747,
      highlights: ['Spiral Staircase View', 'Bangle Shopping', 'Irani Chai'],
      crowdAdvice: 'Extremely high evening crowd. Morning hours are peaceful.',
    ),
  ];

  static SevenWondersPackage getSevenWondersPackage() {
    return SevenWondersPackage(
      title: '7 Wonders of the World Expedition',
      tagline: 'Experience humanity\'s most breathtaking architectural masterworks across 4 continents.',
      totalDays: 21,
      estimatedPrice: 2850.0,
      wonders: allDestinations.where((d) => d.category == '7 Wonders').toList(),
    );
  }
}

// Service for Crowd Analytics and Predictions
class CrowdService {
  static List<CrowdPrediction> generateHourlyPredictions(Destination destination) {
    final List<CrowdPrediction> predictions = [];
    final currentHour = DateTime.now().hour;

    for (int i = 0; i < 6; i++) {
      int hour = (currentHour + (i * 2)) % 24;
      String label = hour == 0
          ? '12 AM'
          : hour < 12
              ? '$hour AM'
              : hour == 12
                  ? '12 PM'
                  : '${hour - 12} PM';

      int percentage = destination.crowdPercentage;
      if (hour >= 11 && hour <= 16) {
        percentage = min(98, percentage + 15);
      } else if (hour >= 18 && hour <= 21) {
        percentage = min(90, percentage + 5);
      } else if (hour < 8 || hour > 21) {
        percentage = max(15, percentage - 45);
      } else {
        percentage = max(25, percentage - 20);
      }

      CrowdLevel level;
      if (percentage < 40) {
        level = CrowdLevel.low;
      } else if (percentage < 70) {
        level = CrowdLevel.moderate;
      } else if (percentage < 88) {
        level = CrowdLevel.high;
      } else {
        level = CrowdLevel.extreme;
      }

      predictions.add(CrowdPrediction(
        timeLabel: label,
        hour: hour,
        level: level,
        percentage: percentage,
      ));
    }
    return predictions;
  }

  static List<Destination> getQuietAlternatives(Destination target) {
    return DestinationRepository.allDestinations
        .where((d) => d.id != target.id && d.crowdPercentage < 60)
        .take(3)
        .toList();
  }
}

// Modular AI Recommendation & Itinerary Service
class AIService {
  static Future<TripItinerary> generatePersonalizedTrip({
    required String destination,
    required int days,
    required double budgetUSD,
    required int travelers,
    required String preference,
    required String pace,
    required DateTime startDate,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    List<DayItinerary> dayPlans = [];

    for (int day = 1; day <= days; day++) {
      List<TripActivity> activities = [];

      if (preference == '7 Wonders') {
        activities = [
          TripActivity(
            timeOfDay: 'Morning (07:30 AM)',
            title: 'Early VIP Guided Monument Tour',
            description: 'Beat the main tourist queue and explore main architectural courtyards with photo guide.',
            category: '7 Wonders',
            approxCost: budgetUSD * 0.15,
            estimatedDuration: '3 Hours',
          ),
          TripActivity(
            timeOfDay: 'Afternoon (01:00 PM)',
            title: 'Heritage Cultural Dining',
            description: 'Sample authentic regional delicacies at top-rated local artisan eatery.',
            category: 'Food',
            approxCost: budgetUSD * 0.08,
            estimatedDuration: '1.5 Hours',
          ),
          TripActivity(
            timeOfDay: 'Evening (05:00 PM)',
            title: 'Sunset Panorama Point & Quiet Walk',
            description: 'Unwind at lower density viewpoints selected by AI crowd predictor.',
            category: 'Nature',
            approxCost: budgetUSD * 0.05,
            estimatedDuration: '2 Hours',
          ),
        ];
      } else {
        activities = [
          TripActivity(
            timeOfDay: 'Morning (08:30 AM)',
            title: 'Explore $destination City Highlights',
            description: 'Visit iconic cultural landmarks during low-density early hours.',
            category: preference,
            approxCost: budgetUSD * 0.10,
            estimatedDuration: '2.5 Hours',
          ),
          TripActivity(
            timeOfDay: 'Afternoon (01:30 PM)',
            title: 'Artisan Market & Local Cuisine',
            description: 'Interactive cultural walkthrough and famous local food tasting.',
            category: 'Food & Shopping',
            approxCost: budgetUSD * 0.07,
            estimatedDuration: '2 Hours',
          ),
          TripActivity(
            timeOfDay: 'Evening (06:00 PM)',
            title: 'Crowd-Free Sunset Escape Point',
            description: 'Recommended quiet nature spot detected by SmartTour real-time scanner.',
            category: 'Relaxation',
            approxCost: 0.0,
            estimatedDuration: '2 Hours',
          ),
        ];
      }

      dayPlans.add(DayItinerary(
        dayNumber: day,
        dayTitle: 'Day $day: $destination - ${preference.toUpperCase()} Focus',
        activities: activities,
      ));
    }

    return TripItinerary(
      id: 'trip_${DateTime.now().millisecondsSinceEpoch}',
      destinationName: destination,
      durationDays: days,
      startDate: startDate,
      budgetUSD: budgetUSD,
      travelersCount: travelers,
      travelPreference: preference,
      travelPace: pace,
      calculatedTotalCost: budgetUSD * 0.85,
      days: dayPlans,
    );
  }
}

class AppState extends ChangeNotifier {
  int currentBottomIndex = 0;
  ThemeMode themeMode = ThemeMode.system;

  String currentLocation = "Tirupati, AP";

  WeatherData get currentWeather => WeatherService.getWeatherForLocation(currentLocation);

  List<TripItinerary> savedTrips = [];

  TripItinerary? activeTrip;

  String searchQuery = "";
  String selectedCategory = "All";

  String geminiApiKey = "";
  String googleMapsApiKey = "";

  AppState() {
    _loadSampleTrip();
  }

  void setBottomIndex(int index) {
    currentBottomIndex = index;
    notifyListeners();
  }

  void toggleTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  void setCurrentLocation(String location) {
    currentLocation = location;
    notifyListeners();
  }

  void saveTrip(TripItinerary trip) {
    if (!savedTrips.any((t) => t.id == trip.id)) {
      savedTrips.add(trip);
      notifyListeners();
    }
  }

  void deleteTrip(String id) {
    savedTrips.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void updateApiKeys(String gemini, String maps) {
    geminiApiKey = gemini;
    googleMapsApiKey = maps;
    notifyListeners();
  }

  void _loadSampleTrip() {
    savedTrips.add(
      TripItinerary(
        id: 'sample_1',
        destinationName: 'Tirupati & Araku Valley',
        durationDays: 3,
        startDate: DateTime.now().add(const Duration(days: 5)),
        budgetUSD: 350.0,
        travelersCount: 2,
        travelPreference: 'Nature & Spiritual',
        travelPace: 'Moderate',
        calculatedTotalCost: 310.0,
        days: [
          const DayItinerary(
            dayNumber: 1,
            dayTitle: 'Day 1: Arrival & Quiet Shrine Visit',
            activities: [
              TripActivity(
                timeOfDay: 'Morning (08:00 AM)',
                title: 'Kapila Theertham Temple Walk',
                description: 'Peaceful morning prayer and waterfall garden stroll.',
                category: 'Spiritual',
                approxCost: 0.0,
                estimatedDuration: '2 Hours',
              ),
              TripActivity(
                timeOfDay: 'Evening (06:00 PM)',
                title: 'Silathoranam Geological Park',
                description: 'Natural rock arch park with zero crowds in sunset hours.',
                category: 'Nature',
                approxCost: 2.0,
                estimatedDuration: '1.5 Hours',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AppStateScope extends InheritedWidget {
  final AppState state;

  const AppStateScope({
    super.key,
    required this.state,
    required super.child,
  });

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'No AppStateScope found in context');
    return scope!.state;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) => true;
}

void main() {
  runApp(const SmartTourApp());
}

class SmartTourApp extends StatefulWidget {
  const SmartTourApp({super.key});

  @override
  State<SmartTourApp> createState() => _SmartTourAppState();
}

class _SmartTourAppState extends State<SmartTourApp> {
  final AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return AppStateScope(
          state: appState,
          child: MaterialApp(
            title: 'SmartTour - AI Travel & Crowd Escape',
            debugShowCheckedModeBanner: false,
            themeMode: appState.themeMode,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: AppColors.primary,
              brightness: Brightness.light,
              scaffoldBackgroundColor: AppColors.surfaceLight,
              fontFamily: 'Roboto',
              textTheme: const TextTheme(
                bodyLarge: TextStyle(letterSpacing: 0.1),
                bodyMedium: TextStyle(letterSpacing: 0.1),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                foregroundColor: Color(0xFF10233F),
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                color: Colors.white,
                shadowColor: Colors.black.withOpacity(0.08),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              chipTheme: ChipThemeData(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                side: BorderSide.none,
                backgroundColor: const Color(0xFFEFF3F9),
                selectedColor: AppColors.primary,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              ),
              sliderTheme: SliderThemeData(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.primary.withOpacity(0.15),
                thumbColor: AppColors.primary,
                overlayColor: AppColors.primary.withOpacity(0.12),
                trackHeight: 5,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                ),
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: AppColors.secondary,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: AppColors.surfaceDark,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
              ),
              cardTheme: CardThemeData(
                elevation: 0,
                color: AppColors.cardDark,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            home: const MainNavigationScreen(),
          ),
        );
      },
    );
  }
}

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final theme = Theme.of(context);

    final List<Widget> screens = [
      const HomeScreen(),
      const ExploreScreen(),
      const AITripPlannerScreen(),
      const CrowdEscapeScreen(),
      const MapScreen(),
      const MyTripsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(color: theme.colorScheme.primary.withOpacity(0.35), blurRadius: 12, offset: const Offset(0, 4)),
                ],
              ),
              child: const Icon(Icons.explore, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              'SmartTour',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21, color: theme.textTheme.bodyLarge?.color, letterSpacing: -0.3),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.accent, Color(0xFFFF7A18)]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('AI', style: TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              state.themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded
                  : (state.themeMode == ThemeMode.light ? Icons.dark_mode_rounded : Icons.brightness_auto_rounded),
              color: theme.colorScheme.primary,
            ),
            onPressed: () => state.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.map_outlined),
            onPressed: () {
              state.setBottomIndex(4);
            },
            tooltip: 'Live Crowd Map',
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => state.setBottomIndex(6),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: IndexedStack(
        index: state.currentBottomIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 68,
          indicatorColor: theme.colorScheme.primary.withOpacity(0.14),
          labelTextStyle: WidgetStateProperty.all(const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
        ),
        child: NavigationBar(
          selectedIndex: state.currentBottomIndex,
          onDestinationSelected: (index) => state.setBottomIndex(index),
          elevation: 3,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.compass_calibration_outlined), selectedIcon: Icon(Icons.compass_calibration), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'AI Planner'),
            NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: 'Crowd Escape'),
            NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Map'),
            NavigationDestination(icon: Icon(Icons.card_travel_outlined), selectedIcon: Icon(Icons.card_travel), label: 'My Trips'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final theme = Theme.of(context);
    final weather = state.currentWeather;
    final sevenWondersPackage = DestinationRepository.getSevenWondersPackage();

    final currentDest = DestinationRepository.allDestinations.firstWhere(
      (d) => d.location.contains(state.currentLocation.split(',')[0]),
      orElse: () => DestinationRepository.allDestinations.first,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- Location bar ----------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: softShadow(opacity: 0.05, blur: 16, offset: const Offset(0, 6)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.location_on_rounded, color: theme.colorScheme.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CURRENT LOCATION', style: TextStyle(fontSize: 10.5, color: theme.hintColor, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: state.currentLocation,
                          isDense: true,
                          icon: Icon(Icons.keyboard_arrow_down_rounded, color: theme.hintColor),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15.5,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          items: [
                            'Tirupati, AP',
                            'Visakhapatnam',
                            'Araku Valley',
                            'Hyderabad',
                            'Taj Mahal, Agra',
                            'Great Wall, China',
                            'Petra, Jordan',
                            'Machu Picchu, Peru',
                            'Christ the Redeemer, Brazil',
                            'Colosseum, Rome',
                            'Chichen Itza, Mexico',
                          ].map((loc) {
                            return DropdownMenuItem(value: loc, child: Text(loc));
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) state.setCurrentLocation(val);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Pill(icon: currentDest.crowdLevel.icon, text: currentDest.crowdLevel.label, color: currentDest.crowdLevel.vividColor),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // ---------- Weather hero card ----------
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(color: theme.colorScheme.primary.withOpacity(0.3), blurRadius: 22, offset: const Offset(0, 12)),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(right: -30, top: -30, child: _GlowCircle(size: 120, color: Colors.white)),
                  Positioned(right: 40, bottom: -40, child: _GlowCircle(size: 90, color: Colors.white)),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.18), shape: BoxShape.circle),
                        child: Icon(weather.icon, size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${weather.tempCelsius}°',
                                  style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800, height: 1),
                                ),
                                const SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    weather.condition,
                                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              weather.travelAdvice,
                              style: TextStyle(color: Colors.white.withOpacity(0.92), fontSize: 12.5, height: 1.3),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _WeatherStat(icon: Icons.water_drop_rounded, value: '${weather.humidity}%'),
                                const SizedBox(width: 14),
                                _WeatherStat(icon: Icons.air_rounded, value: '${weather.windSpeedKm.toStringAsFixed(0)} km/h'),
                                const SizedBox(width: 14),
                                _WeatherStat(icon: Icons.wb_sunny_outlined, value: 'UV ${weather.uvIndex}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 26),

          Text('Smart AI Features', style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w800, color: theme.textTheme.bodyLarge?.color, letterSpacing: -0.2)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _FeatureCard(
                  onTap: () => state.setBottomIndex(2),
                  icon: Icons.auto_awesome,
                  title: 'AI Trip Planner',
                  subtitle: 'Personalized itineraries in seconds',
                  colors: const [Color(0xFF0B6FC9), Color(0xFF14B8A6)],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FeatureCard(
                  onTap: () => state.setBottomIndex(3),
                  icon: Icons.groups,
                  title: 'Escape the Crowd',
                  subtitle: 'Find quiet alternatives nearby',
                  colors: const [Color(0xFFE8590C), Color(0xFFFFB020)],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ---------- 7 Wonders card ----------
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF101B33), Color(0xFF1E293B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: softShadow(opacity: 0.18, blur: 24, offset: const Offset(0, 12)),
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.accent, Color(0xFFFF7A18)]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text('WORLD TOUR', style: TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w800, letterSpacing: 0.4)),
                    ),
                    const Spacer(),
                    const Icon(Icons.star_rounded, color: AppColors.accent, size: 18),
                    const SizedBox(width: 4),
                    const Text('4.9 · 7 Wonders Package', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  sevenWondersPackage.title,
                  style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.3),
                ),
                const SizedBox(height: 6),
                Text(
                  sevenWondersPackage.tagline,
                  style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.3),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 124,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sevenWondersPackage.wonders.length,
                    itemBuilder: (context, index) {
                      final wonder = sevenWondersPackage.wonders[index];
                      return Container(
                        width: 108,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(wonder.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [Colors.black.withOpacity(0.85), Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            wonder.name,
                            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('21 Days · All Inclusive', style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.w600)),
                        Text(
                          '\$${sevenWondersPackage.estimatedPrice.toInt()} USD',
                          style: const TextStyle(color: AppColors.accent, fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: const Color(0xFF1A1200),
                      ),
                      onPressed: () {
                        state.setBottomIndex(2);
                      },
                      icon: const Icon(Icons.auto_awesome, size: 16),
                      label: const Text('Plan Wonders Trip', style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 26),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Destinations', style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w800, color: theme.textTheme.bodyLarge?.color, letterSpacing: -0.2)),
              TextButton(
                onPressed: () => state.setBottomIndex(1),
                child: const Text('See All', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 244,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DestinationRepository.allDestinations.length,
              itemBuilder: (context, index) {
                final dest = DestinationRepository.allDestinations[index];
                return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: softShadow(opacity: 0.07, blur: 18, offset: const Offset(0, 8)),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              dest.imageUrl,
                              height: 118,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black.withOpacity(0.45), Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.65),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star_rounded, color: AppColors.accent, size: 13),
                                    const SizedBox(width: 3),
                                    Text('${dest.rating}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dest.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(Icons.place_outlined, size: 12, color: theme.hintColor),
                                  const SizedBox(width: 3),
                                  Expanded(child: Text(dest.location, style: TextStyle(color: theme.hintColor, fontSize: 11.5), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Pill(icon: dest.crowdLevel.icon, text: dest.crowdLevel.label, color: dest.crowdLevel.vividColor, fontSize: 10.5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherStat extends StatelessWidget {
  final IconData icon;
  final String value;
  const _WeatherStat({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.white70),
        const SizedBox(width: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> colors;

  const _FeatureCard({
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: softShadow(opacity: 0.06, blur: 16, offset: const Offset(0, 8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: colors.first.withOpacity(0.35), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(height: 12),
              Text(title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: theme.textTheme.bodyLarge?.color)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(fontSize: 11.5, color: theme.hintColor, height: 1.25)),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = ['All', '7 Wonders', 'Spiritual', 'Beaches', 'Nature', 'Historical'];

    final filteredList = selectedCategory == 'All'
        ? DestinationRepository.allDestinations
        : DestinationRepository.allDestinations.where((d) => d.category == selectedCategory || d.category.contains(selectedCategory)).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Column(
          children: [
            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      showCheckmark: false,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : theme.textTheme.bodyLarge?.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.5,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = cat;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final dest = filteredList[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: softShadow(opacity: 0.06, blur: 14, offset: const Offset(0, 6)),
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                dest.imageUrl,
                                height: 108,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 7,
                                left: 7,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star_rounded, color: AppColors.accent, size: 12),
                                      const SizedBox(width: 2),
                                      Text('${dest.rating}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dest.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12.5), maxLines: 1, overflow: TextOverflow.ellipsis),
                                Text(dest.location, style: TextStyle(color: theme.hintColor, fontSize: 10.5), maxLines: 1, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 7),
                                Pill(icon: dest.crowdLevel.icon, text: '${dest.crowdPercentage}%', color: dest.crowdLevel.vividColor, fontSize: 10),
                                const SizedBox(height: 5),
                                Text(
                                  '\$${dest.approxCost.toInt()} approx entry',
                                  style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: theme.textTheme.bodyLarge?.color),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AITripPlannerScreen extends StatefulWidget {
  const AITripPlannerScreen({super.key});

  @override
  State<AITripPlannerScreen> createState() => _AITripPlannerScreenState();
}

class _AITripPlannerScreenState extends State<AITripPlannerScreen> {
  String selectedDestination = DestinationRepository.allDestinations.first.name;
  double numberOfDays = 3;
  double budgetUSD = 400;
  int travelersCount = 2;
  String travelPreference = "Nature";
  String travelPace = "Moderate";
  DateTime startDate = DateTime.now().add(const Duration(days: 2));
  bool isGenerating = false;

  final List<String> preferences = ['Adventure', 'Nature', 'Historical', 'Beaches', 'Food', 'Spiritual', '7 Wonders'];

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final theme = Theme.of(context);

    if (isGenerating) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [theme.colorScheme.primary, AppColors.secondary]),
                  boxShadow: [BoxShadow(color: theme.colorScheme.primary.withOpacity(0.3), blurRadius: 28, offset: const Offset(0, 10))],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                ),
              ),
              const SizedBox(height: 24),
              const Text('AI is crafting your optimized\ncrowd-free itinerary…', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.5, height: 1.35)),
              const SizedBox(height: 8),
              Text('Analyzing live traffic, local weather & peak tourist hours', textAlign: TextAlign.center, style: TextStyle(color: theme.hintColor, fontSize: 12.5)),
            ],
          ),
        ),
      );
    }

    if (state.activeTrip != null) {
      final trip = state.activeTrip!;
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [theme.colorScheme.primary, AppColors.secondary]),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [BoxShadow(color: theme.colorScheme.primary.withOpacity(0.28), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                        child: const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text('AI Custom Itinerary: ${trip.destinationName}',
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('${trip.durationDays} Days · ${trip.travelersCount} Travelers · \$${trip.calculatedTotalCost.toInt()} Total Cost',
                      style: const TextStyle(fontSize: 12.5, color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trip.days.length,
              itemBuilder: (context, index) {
                final day = trip.days[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), boxShadow: softShadow(opacity: 0.05, blur: 14, offset: const Offset(0, 6))),
                  child: Theme(
                    data: theme.copyWith(dividerColor: Colors.transparent),
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(day.dayTitle, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5)),
                        children: day.activities.map((act) {
                          return ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.12), shape: BoxShape.circle),
                              child: Icon(Icons.access_time_rounded, color: theme.colorScheme.primary, size: 18),
                            ),
                            title: Text(act.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                            subtitle: Text('${act.timeOfDay} · ${act.description}', style: const TextStyle(fontSize: 12, height: 1.3)),
                            trailing: Text('\$${act.approxCost.toInt()}', style: TextStyle(fontWeight: FontWeight.w800, color: theme.colorScheme.primary)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary, foregroundColor: Colors.white),
                    onPressed: () {
                      state.saveTrip(trip);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Trip saved to My Trips!')));
                    },
                    icon: const Icon(Icons.bookmark_border),
                    label: const Text('Save Itinerary', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      state.activeTrip = null;
                    });
                  },
                  child: const Text('Create New', style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Plan Your Trip with AI', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.3, color: theme.textTheme.bodyLarge?.color)),
          const SizedBox(height: 4),
          Text('Personalized crowd-optimized itineraries generated in real time', style: TextStyle(color: theme.hintColor, fontSize: 12.5)),
          const SizedBox(height: 22),

          _SectionLabel(text: 'Destination'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: theme.cardTheme.color,
              borderRadius: BorderRadius.circular(16),
              boxShadow: softShadow(opacity: 0.05, blur: 12, offset: const Offset(0, 4)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: DropdownButtonFormField<String>(
              value: DestinationRepository.allDestinations.any((d) => d.name == selectedDestination)
                  ? selectedDestination
                  : DestinationRepository.allDestinations.first.name,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
              items: DestinationRepository.allDestinations.map((d) {
                return DropdownMenuItem<String>(
                  value: d.name,
                  child: Text('${d.name} (${d.location})'),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selectedDestination = val;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 18),

          _SectionLabel(text: 'Duration: ${numberOfDays.toInt()} Days'),
          Slider(
            value: numberOfDays,
            min: 1,
            max: 14,
            divisions: 13,
            label: '${numberOfDays.toInt()} Days',
            onChanged: (val) => setState(() => numberOfDays = val),
          ),
          const SizedBox(height: 6),

          _SectionLabel(text: 'Estimated Budget: \$${budgetUSD.toInt()} USD'),
          Slider(
            value: budgetUSD,
            min: 100,
            max: 3000,
            divisions: 29,
            label: '\$${budgetUSD.toInt()}',
            onChanged: (val) => setState(() => budgetUSD = val),
          ),
          const SizedBox(height: 10),

          _SectionLabel(text: 'Travel Preference'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: preferences.map((pref) {
              final isSel = travelPreference == pref;
              return ChoiceChip(
                label: Text(pref),
                selected: isSel,
                showCheckmark: false,
                labelStyle: TextStyle(color: isSel ? Colors.white : theme.textTheme.bodyLarge?.color, fontWeight: FontWeight.w700, fontSize: 12.5),
                onSelected: (_) => setState(() => travelPreference = pref),
              );
            }).toList(),
          ),
          const SizedBox(height: 26),

          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                shadowColor: theme.colorScheme.primary.withOpacity(0.4),
              ),
              onPressed: () async {
                setState(() => isGenerating = true);
                final itinerary = await AIService.generatePersonalizedTrip(
                  destination: selectedDestination,
                  days: numberOfDays.toInt(),
                  budgetUSD: budgetUSD,
                  travelers: travelersCount,
                  preference: travelPreference,
                  pace: travelPace,
                  startDate: startDate,
                );
                setState(() {
                  isGenerating = false;
                  state.activeTrip = itinerary;
                });
              },
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Generate My AI Itinerary', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: Theme.of(context).textTheme.bodyLarge?.color));
  }
}

class CrowdEscapeScreen extends StatefulWidget {
  const CrowdEscapeScreen({super.key});

  @override
  State<CrowdEscapeScreen> createState() => _CrowdEscapeScreenState();
}

class _CrowdEscapeScreenState extends State<CrowdEscapeScreen> {
  late Destination selectedDestination;

  @override
  void initState() {
    super.initState();
    selectedDestination = DestinationRepository.allDestinations.first;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final predictions = CrowdService.generateHourlyPredictions(selectedDestination);
    final alternatives = CrowdService.getQuietAlternatives(selectedDestination);
    final crowdColor = selectedDestination.crowdLevel.vividColor;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.cardTheme.color,
              borderRadius: BorderRadius.circular(22),
              boxShadow: softShadow(opacity: 0.06, blur: 16, offset: const Offset(0, 8)),
            ),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SELECT TARGET DESTINATION', style: TextStyle(fontSize: 10.5, color: theme.hintColor, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Destination>(
                    isExpanded: true,
                    value: selectedDestination,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: theme.textTheme.bodyLarge?.color),
                    items: DestinationRepository.allDestinations.map((d) {
                      return DropdownMenuItem(value: d, child: Text(d.name));
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => selectedDestination = val);
                    },
                  ),
                ),
                const Divider(height: 28),
                Row(
                  children: [
                    _CrowdGauge(percentage: selectedDestination.crowdPercentage, color: crowdColor, icon: selectedDestination.crowdLevel.icon),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Live Crowd Density', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.5, color: Colors.grey)),
                          Text('${selectedDestination.crowdPercentage}%', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26, color: crowdColor, height: 1.1)),
                          const SizedBox(height: 4),
                          Pill(text: selectedDestination.crowdLevel.label, color: crowdColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (selectedDestination.crowdLevel == CrowdLevel.high || selectedDestination.crowdLevel == CrowdLevel.extreme)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: crowdColor.withOpacity(0.1),
                border: Border.all(color: crowdColor.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: crowdColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${selectedDestination.name} is currently heavily crowded. Expect long queue delays.',
                      style: TextStyle(color: crowdColor, fontSize: 12.5, fontWeight: FontWeight.w700, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 22),

          Text('Hourly Crowd Forecast', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w800, color: theme.textTheme.bodyLarge?.color)),
          const SizedBox(height: 12),
          SizedBox(
            height: 108,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                final pred = predictions[index];
                final pColor = pred.level.vividColor;
                return Container(
                  width: 92,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  decoration: BoxDecoration(
                    color: theme.cardTheme.color,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: pColor.withOpacity(0.25)),
                    boxShadow: softShadow(opacity: 0.04, blur: 10, offset: const Offset(0, 4)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(pred.timeLabel, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 6,
                          width: 60,
                          color: pColor.withOpacity(0.15),
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: (pred.percentage / 100).clamp(0.05, 1.0),
                            child: Container(color: pColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('${pred.percentage}%', style: TextStyle(color: pColor, fontWeight: FontWeight.w800, fontSize: 15)),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 26),

          Text('Better Quiet Alternatives Near You', style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w800, color: theme.textTheme.bodyLarge?.color)),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: alternatives.length,
            itemBuilder: (context, index) {
              final alt = alternatives[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), boxShadow: softShadow(opacity: 0.05, blur: 12, offset: const Offset(0, 6))),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(alt.imageUrl, width: 72, height: 72, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(alt.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  Icon(Icons.near_me_rounded, size: 12, color: alt.crowdLevel.vividColor),
                                  const SizedBox(width: 3),
                                  Text('${alt.distanceKm} km away · ${alt.crowdPercentage}% crowd',
                                      style: TextStyle(color: alt.crowdLevel.vividColor, fontSize: 11.5, fontWeight: FontWeight.w700)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(alt.crowdAdvice, style: TextStyle(color: theme.hintColor, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.1), shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(Icons.navigation_rounded, color: theme.colorScheme.primary),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Navigating to ${alt.name}...')));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Compact circular crowd-percentage gauge used on the Crowd Escape screen.
class _CrowdGauge extends StatelessWidget {
  final int percentage;
  final Color color;
  final IconData icon;
  const _CrowdGauge({required this.percentage, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 68,
            height: 68,
            child: CircularProgressIndicator(
              value: (percentage / 100).clamp(0.0, 1.0),
              strokeWidth: 6,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeCap: StrokeCap.round,
            ),
          ),
          Icon(icon, color: color, size: 24),
        ],
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE2E8F0), Color(0xFFCBD5E1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: CustomPaint(
              size: Size.infinite,
              painter: MapPainter(destinations: DestinationRepository.allDestinations),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.94),
                borderRadius: BorderRadius.circular(20),
                boxShadow: softShadow(opacity: 0.1, blur: 18, offset: const Offset(0, 8)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLegendItem(const Color(0xFF17A672), 'Low Crowd'),
                  _buildLegendItem(const Color(0xFFF59E0B), 'Moderate'),
                  _buildLegendItem(const Color(0xFFE0324A), 'High Crowd'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 6)]),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class MapPainter extends CustomPainter {
  final List<Destination> destinations;

  MapPainter({required this.destinations});

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = const Color(0xFF0B6FC9).withOpacity(0.28)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < min(5, destinations.length); i++) {
      final dx = (i * 70.0) % size.width;
      final dy = (i * 110.0 + 100) % size.height;
      canvas.drawLine(center, Offset(dx, dy), paintLine);

      final glowPaint = Paint()..color = destinations[i].crowdLevel.vividColor.withOpacity(0.25);
      canvas.drawCircle(Offset(dx, dy), 20, glowPaint);

      final pinPaint = Paint()..color = destinations[i].crowdLevel.vividColor;
      canvas.drawCircle(Offset(dx, dy), 12, pinPaint);

      final ringPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;
      canvas.drawCircle(Offset(dx, dy), 12, ringPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final theme = Theme.of(context);

    if (state.savedTrips.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.08), shape: BoxShape.circle),
                child: Icon(Icons.card_travel_rounded, size: 56, color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 20),
              const Text('No Saved Trips Yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text('Your AI-generated itineraries will appear here', style: TextStyle(color: theme.hintColor, fontSize: 12.5)),
              const SizedBox(height: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary, foregroundColor: Colors.white),
                onPressed: () => state.setBottomIndex(2),
                child: const Text('Plan A Trip Now', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.savedTrips.length,
      itemBuilder: (context, index) {
        final trip = state.savedTrips[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), boxShadow: softShadow(opacity: 0.05, blur: 12, offset: const Offset(0, 6))),
          child: Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [theme.colorScheme.primary, AppColors.secondary]),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.card_travel_rounded, color: Colors.white, size: 20),
              ),
              title: Text(trip.destinationName, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5)),
              subtitle: Text('${trip.durationDays} Days · \$${trip.calculatedTotalCost.toInt()} Budget', style: const TextStyle(fontSize: 12)),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                onPressed: () => state.deleteTrip(trip.id),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: softShadow(opacity: 0.06, blur: 16, offset: const Offset(0, 8))),
            child: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [theme.colorScheme.primary, AppColors.secondary]),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: theme.scaffoldBackgroundColor,
                        child: Icon(Icons.person, color: theme.colorScheme.primary, size: 34),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Smart Tourist', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                        const SizedBox(height: 4),
                        Pill(icon: Icons.emoji_events_rounded, text: 'Explorer Level 3', color: AppColors.accent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: softShadow(opacity: 0.06, blur: 16, offset: const Offset(0, 8))),
            child: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Theme Preference', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: theme.textTheme.bodyLarge?.color)),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<ThemeMode>(
                        style: SegmentedButton.styleFrom(
                          selectedBackgroundColor: theme.colorScheme.primary,
                          selectedForegroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        segments: const [
                          ButtonSegment(value: ThemeMode.system, icon: Icon(Icons.brightness_auto_rounded), label: Text('System')),
                          ButtonSegment(value: ThemeMode.light, icon: Icon(Icons.light_mode_rounded), label: Text('Light')),
                          ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.dark_mode_rounded), label: Text('Dark')),
                        ],
                        selected: {state.themeMode},
                        onSelectionChanged: (set) => state.setThemeMode(set.first),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
