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
    required this.iconAsset,
    this.label,
  });

  final String id;
  final String iconAsset;
  final String? label;

  bool get isIconOnly => label == null;

  static const demoItems = [
    HomeSportCategory(
      id: 'saved',
      iconAsset: FixedAssets.bookmark,
    ),
    HomeSportCategory(
      id: 'paddle',
      iconAsset: FixedAssets.padel,
      label: 'Paddle',
    ),
    HomeSportCategory(
      id: 'tennis',
      iconAsset: FixedAssets.tennisRacket,
      label: 'Tennis',
    ),
    HomeSportCategory(
      id: 'table-tennis',
      iconAsset: FixedAssets.padel,
      label: 'Table Tennis',
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

  bool get isMorning => period.toLowerCase() == 'am';
}

class HomeBookingPackage {
  const HomeBookingPackage({
    required this.name,
    required this.totalSessions,
    required this.remainingSessions,
  });

  final String name;
  final int totalSessions;
  final int remainingSessions;

  double get progress => remainingSessions / totalSessions;

  static const demo = HomeBookingPackage(
    name: 'Package Name',
    totalSessions: 10,
    remainingSessions: 6,
  );
}

class HomeCoachDate {
  const HomeCoachDate({
    required this.id,
    required this.day,
    required this.weekday,
  });

  final String id;
  final String day;
  final String weekday;

  static const initialSelectedId = 'coach-date-21';

  static const demoItems = [
    HomeCoachDate(id: 'coach-date-19', day: '19', weekday: 'Sat'),
    HomeCoachDate(id: 'coach-date-20', day: '20', weekday: 'Sun'),
    HomeCoachDate(id: 'coach-date-21', day: '21', weekday: 'Mon'),
    HomeCoachDate(id: 'coach-date-22', day: '22', weekday: 'Tue'),
    HomeCoachDate(id: 'coach-date-23', day: '23', weekday: 'Wed'),
    HomeCoachDate(id: 'coach-date-24', day: '24', weekday: 'Thu'),
    HomeCoachDate(id: 'coach-date-25', day: '25', weekday: 'Fri'),
    HomeCoachDate(id: 'coach-date-26', day: '26', weekday: 'Sat'),
  ];
}

class HomeCoachProfile {
  const HomeCoachProfile({
    required this.id,
    required this.name,
    required this.avatarAsset,
    required this.sport,
    required this.level,
    required this.timeslots,
  });

  final String id;
  final String name;
  final String avatarAsset;
  final String sport;
  final String level;
  final List<HomeTimeSlot> timeslots;

  static const demoItems = [
    HomeCoachProfile(
      id: 'coach-ibrahim-1',
      name: 'Ibrahim Hassan',
      avatarAsset: FixedAssets.homeProfileAvatar,
      sport: 'Padel',
      level: 'Advanced',
      timeslots: _demoTimeslots,
    ),
    HomeCoachProfile(
      id: 'coach-ibrahim-2',
      name: 'Ibrahim Hassan',
      avatarAsset: FixedAssets.homeProfileAvatar,
      sport: 'Padel',
      level: 'Advanced',
      timeslots: _demoTimeslots,
    ),
  ];

  static const _demoTimeslots = [
    HomeTimeSlot(id: 'coach-01-am', time: '01:00', period: 'am'),
    HomeTimeSlot(id: 'coach-02-am', time: '02:00', period: 'am'),
    HomeTimeSlot(id: 'coach-03-am-1', time: '03:00', period: 'am'),
    HomeTimeSlot(id: 'coach-03-am-2', time: '03:00', period: 'am'),
    HomeTimeSlot(id: 'coach-03-am-3', time: '03:00', period: 'am'),
    HomeTimeSlot(id: 'coach-03-am-4', time: '03:00', period: 'am'),
    HomeTimeSlot(id: 'coach-03-am-5', time: '03:00', period: 'am'),
  ];
}

class HomeReservationDate {
  const HomeReservationDate({
    required this.id,
    required this.day,
    required this.weekday,
    this.isBooked = false,
  });

  final String id;
  final String day;
  final String weekday;
  final bool isBooked;

  static const initialSelectedId = 'date-21';

  static const demoItems = [
    HomeReservationDate(id: 'date-19', day: '19', weekday: 'Sun'),
    HomeReservationDate(id: 'date-20', day: '20', weekday: 'Sun'),
    HomeReservationDate(id: 'date-21', day: '21', weekday: 'Sun'),
    HomeReservationDate(id: 'date-22', day: '22', weekday: 'Sun'),
    HomeReservationDate(id: 'date-23', day: '23', weekday: 'Sun'),
    HomeReservationDate(id: 'date-24', day: '24', weekday: 'Sun'),
  ];
}

class HomeBookingDuration {
  const HomeBookingDuration({
    required this.id,
    required this.minutes,
  });

  final String id;
  final int minutes;

  static const initialSelectedId = 'duration-60';

  static const demoItems = [
    HomeBookingDuration(id: 'duration-30', minutes: 30),
    HomeBookingDuration(id: 'duration-60', minutes: 60),
    HomeBookingDuration(id: 'duration-90', minutes: 90),
  ];
}

class HomeBookingCourt {
  const HomeBookingCourt({
    required this.id,
    required this.name,
    required this.type,
    required this.isIndoor,
  });

  final String id;
  final String name;
  final HomeBookingCourtType type;
  final bool isIndoor;

  static const initialSelectedId = 'court-c1';

  static const demoItems = [
    HomeBookingCourt(
      id: 'court-a1',
      name: 'A1',
      type: HomeBookingCourtType.mixed,
      isIndoor: true,
    ),
    HomeBookingCourt(
      id: 'court-b1',
      name: 'B1',
      type: HomeBookingCourtType.ladiesOnly,
      isIndoor: false,
    ),
    HomeBookingCourt(
      id: 'court-c1',
      name: 'C1',
      type: HomeBookingCourtType.mixed,
      isIndoor: true,
    ),
    HomeBookingCourt(
      id: 'court-a2',
      name: 'A2',
      type: HomeBookingCourtType.mixed,
      isIndoor: true,
    ),
    HomeBookingCourt(
      id: 'court-b2',
      name: 'B2',
      type: HomeBookingCourtType.private,
      isIndoor: false,
    ),
    HomeBookingCourt(
      id: 'court-c2',
      name: 'C2',
      type: HomeBookingCourtType.private,
      isIndoor: true,
    ),
  ];
}

class HomeCourtVenue {
  const HomeCourtVenue({
    required this.id,
    required this.name,
    required this.location,
    required this.clubSubtitle,
    required this.imageAsset,
    required this.galleryAssets,
    required this.distanceKm,
    required this.price,
    required this.bookingPrice,
    required this.rating,
    required this.isIndoor,
    required this.zone,
    required this.description,
    required this.amenities,
    required this.timeslots,
  });

  final String id;
  final String name;
  final String location;
  final String clubSubtitle;
  final String imageAsset;
  final List<String> galleryAssets;
  final double distanceKm;
  final int price;
  final double bookingPrice;
  final double rating;
  final bool isIndoor;
  final String zone;
  final String description;
  final List<HomeCourtAmenity> amenities;
  final List<HomeTimeSlot> timeslots;

  String get distanceText => distanceKm.toStringAsFixed(1);
  String get priceText => price.toString();
  String get bookingPriceText => bookingPrice.toStringAsFixed(2);
  String get ratingText => rating.toStringAsFixed(1);
  String get detailRatingText => '${rating.round()} Stars';
  String get detailDistanceText => '${distanceKm.round()} Kms';
  String get detailTypeText => isIndoor ? 'Indoor' : 'Outdoor';

  static const demoItems = [
    HomeCourtVenue(
      id: 'court-smash-1',
      name: 'The Court Smash',
      location: 'Al Juffair',
      clubSubtitle: 'Padel Club',
      imageAsset: FixedAssets.homeCourt,
      galleryAssets: _galleryAssets,
      distanceKm: 4,
      price: 90,
      bookingPrice: 35.50,
      rating: 4,
      isIndoor: true,
      zone: 'Jeddah',
      description: _detailDescription,
      amenities: HomeCourtAmenity.demoItems,
      timeslots: _activeTimeslots,
    ),
    HomeCourtVenue(
      id: 'court-smash-2',
      name: 'The Court Smash',
      location: 'Al Juffair',
      clubSubtitle: 'Padel Club',
      imageAsset: FixedAssets.homeCourt,
      galleryAssets: _galleryAssets,
      distanceKm: 4,
      price: 90,
      bookingPrice: 35.50,
      rating: 4,
      isIndoor: true,
      zone: 'Jeddah',
      description: _detailDescription,
      amenities: HomeCourtAmenity.demoItems,
      timeslots: _mutedTimeslots,
    ),
    HomeCourtVenue(
      id: 'court-smash-3',
      name: 'The Court Smash',
      location: 'Al Juffair',
      clubSubtitle: 'Padel Club',
      imageAsset: FixedAssets.homeCourt,
      galleryAssets: _galleryAssets,
      distanceKm: 4,
      price: 90,
      bookingPrice: 35.50,
      rating: 4,
      isIndoor: true,
      zone: 'Jeddah',
      description: _detailDescription,
      amenities: HomeCourtAmenity.demoItems,
      timeslots: _activeTimeslots,
    ),
  ];

  static HomeCourtVenue demoById(String id) {
    return demoItems.firstWhere(
      (venue) => venue.id == id,
      orElse: () => demoItems.first,
    );
  }

  static const _galleryAssets = [
    FixedAssets.homeCourt,
    FixedAssets.homeCourt,
    FixedAssets.homeCourt,
  ];

  static const _detailDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elititam et, '
      'consectetur adipiscing elit, sed don m ad minim ventam Lorem ipsum '
      'dolor sit amet, consectetur adipiscing elititam et, consectetur '
      'adipiscing elit, sed don m ad minim ventam Lorem ipsum dolor sit amet, '
      'consectetur adipiscing elititam et, consectetur adipiscing elit, sed '
      'don';

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

class HomeCourtAmenity {
  const HomeCourtAmenity({
    required this.type,
    required this.icon,
  });

  final HomeCourtAmenityType type;
  final FaIconData icon;

  static const demoItems = [
    HomeCourtAmenity(
      type: HomeCourtAmenityType.racket,
      icon: FontAwesomeIcons.tableTennisPaddleBall,
    ),
    HomeCourtAmenity(
      type: HomeCourtAmenityType.ball,
      icon: FontAwesomeIcons.baseball,
    ),
    HomeCourtAmenity(
      type: HomeCourtAmenityType.shower,
      icon: FontAwesomeIcons.shower,
    ),
    HomeCourtAmenity(
      type: HomeCourtAmenityType.toilet,
      icon: FontAwesomeIcons.toilet,
    ),
    HomeCourtAmenity(
      type: HomeCourtAmenityType.water,
      icon: FontAwesomeIcons.bottleWater,
    ),
  ];
}

enum HomeCourtAmenityType { racket, ball, shower, toilet, water }

enum HomeBookingCourtType { mixed, ladiesOnly, private }

enum HomeBottomNavItem {
  home,
  calendar,
  profile,
  trophy,
  menu
  ;

  String get iconAsset {
    return switch (this) {
      HomeBottomNavItem.home => FixedAssets.home,
      HomeBottomNavItem.calendar => FixedAssets.calendar,
      HomeBottomNavItem.profile => FixedAssets.user,
      HomeBottomNavItem.trophy => FixedAssets.cup,
      HomeBottomNavItem.menu => FixedAssets.menuGrid,
    };
  }

  String? get selectedIconAsset {
    return switch (this) {
      HomeBottomNavItem.menu => FixedAssets.menuGridSelected,
      _ => null,
    };
  }
}
