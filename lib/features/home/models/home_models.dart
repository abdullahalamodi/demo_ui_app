import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/fixed_assets.dart';

class HomeUser {
  const HomeUser({
    required this.firstName,
    required this.avatarAsset,
  });

  final String firstName;
  final String avatarAsset;

  static const demo = HomeUser(
    firstName: 'Khalid',
    avatarAsset: FixedAssets.homeProfileAvatar,
  );
}

class HomeSportCategory {
  const HomeSportCategory({
    required this.id,
    required this.icon,
    this.label,
  });

  final String id;
  final FaIconData icon;
  final String? label;

  bool get isIconOnly => label == null;

  static const demoItems = [
    HomeSportCategory(
      id: 'saved',
      icon: FontAwesomeIcons.bookmark,
    ),
    HomeSportCategory(
      id: 'paddle',
      icon: FontAwesomeIcons.tableTennisPaddleBall,
      label: 'Paddle',
    ),
    HomeSportCategory(
      id: 'tennis',
      icon: FontAwesomeIcons.tableTennisPaddleBall,
      label: 'Tennis',
    ),
    HomeSportCategory(
      id: 'table-tennis',
      icon: FontAwesomeIcons.tableTennisPaddleBall,
      label: 'Paddle',
    ),
  ];
}

class HomeTimeSlot {
  const HomeTimeSlot({
    required this.id,
    required this.time,
    required this.period,
    this.isEnabled = true,
  });

  final String id;
  final String time;
  final String period;
  final bool isEnabled;
}

class HomeCourtVenue {
  const HomeCourtVenue({
    required this.id,
    required this.name,
    required this.location,
    required this.imageAsset,
    required this.distanceKm,
    required this.price,
    required this.rating,
    required this.isIndoor,
    required this.timeslots,
  });

  final String id;
  final String name;
  final String location;
  final String imageAsset;
  final double distanceKm;
  final int price;
  final double rating;
  final bool isIndoor;
  final List<HomeTimeSlot> timeslots;

  String get distanceText => distanceKm.toStringAsFixed(1);
  String get priceText => price.toString();
  String get ratingText => rating.toStringAsFixed(1);

  static const demoItems = [
    HomeCourtVenue(
      id: 'court-smash-1',
      name: 'The Court Smash',
      location: 'Al Juffair',
      imageAsset: FixedAssets.homeCourt,
      distanceKm: 4,
      price: 90,
      rating: 4.9,
      isIndoor: true,
      timeslots: _activeTimeslots,
    ),
    HomeCourtVenue(
      id: 'court-smash-2',
      name: 'The Court Smash',
      location: 'Al Juffair',
      imageAsset: FixedAssets.homeCourt,
      distanceKm: 4,
      price: 90,
      rating: 4.9,
      isIndoor: true,
      timeslots: _mutedTimeslots,
    ),
    HomeCourtVenue(
      id: 'court-smash-3',
      name: 'The Court Smash',
      location: 'Al Juffair',
      imageAsset: FixedAssets.homeCourt,
      distanceKm: 4,
      price: 90,
      rating: 4.9,
      isIndoor: true,
      timeslots: _activeTimeslots,
    ),
  ];

  static const _activeTimeslots = [
    HomeTimeSlot(id: '10-am', time: '10:00', period: 'am'),
    HomeTimeSlot(id: '11-am', time: '11:00', period: 'am'),
    HomeTimeSlot(id: '12-am', time: '12:00', period: 'am'),
    HomeTimeSlot(id: '01-pm', time: '01:00', period: 'pm'),
    HomeTimeSlot(id: '02-pm', time: '02:00', period: 'pm'),
    HomeTimeSlot(id: '03-pm', time: '03:00', period: 'pm'),
  ];

  static const _mutedTimeslots = [
    HomeTimeSlot(
      id: '10-am',
      time: '10:00',
      period: 'am',
      isEnabled: false,
    ),
    HomeTimeSlot(
      id: '11-am',
      time: '11:00',
      period: 'am',
      isEnabled: false,
    ),
    HomeTimeSlot(
      id: '12-am',
      time: '12:00',
      period: 'am',
      isEnabled: false,
    ),
    HomeTimeSlot(
      id: '01-pm',
      time: '01:00',
      period: 'pm',
      isEnabled: false,
    ),
    HomeTimeSlot(
      id: '02-pm',
      time: '02:00',
      period: 'pm',
      isEnabled: false,
    ),
    HomeTimeSlot(
      id: '03-pm',
      time: '03:00',
      period: 'pm',
      isEnabled: false,
    ),
  ];
}

enum HomeBottomNavItem {
  home,
  calendar,
  profile,
  trophy,
  menu
  ;

  FaIconData get icon {
    return switch (this) {
      HomeBottomNavItem.home => FontAwesomeIcons.house,
      HomeBottomNavItem.calendar => FontAwesomeIcons.calendarDays,
      HomeBottomNavItem.profile => FontAwesomeIcons.user,
      HomeBottomNavItem.trophy => FontAwesomeIcons.trophy,
      HomeBottomNavItem.menu => FontAwesomeIcons.grip,
    };
  }
}
