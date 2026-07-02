// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Demo UI App';

  @override
  String get homeTitle => 'UI foundation is ready';

  @override
  String get homeMessage =>
      'Start adding feature screens with localized strings, demo UI models, reusable widgets, and go_router routes.';

  @override
  String get homeReadyTitle => 'Guide conventions initialized';

  @override
  String get homeReadyMessage =>
      'The app shell, theme, routing, localization, shared widgets, and feature-first folders are in place.';

  @override
  String homeGreeting(String name) {
    return 'Hi, $name';
  }

  @override
  String get homeWelcomeBack => 'Welcome Back';

  @override
  String get homeSettingsAction => 'Settings';

  @override
  String get homeNotificationsAction => 'Notifications';

  @override
  String get homeSearchResults => 'Search Results';

  @override
  String homeCourtCount(int count) {
    return '$count Court';
  }

  @override
  String get homeSavedAction => 'Saved venues';

  @override
  String get homeShareAction => 'Share venue';

  @override
  String get homeSelectCity => 'Select City';

  @override
  String get homeNearest => 'Nearest';

  @override
  String get homeIndoor => 'Indoor';

  @override
  String get homeAvailableTimeslots => 'Available Timeslots';

  @override
  String get homeFilter => 'Filter';

  @override
  String get homeFilterResults => 'Filter Results';

  @override
  String get homeAvailability => 'Availability';

  @override
  String get homeShowNonAvailableClubs => 'Show Non Available Clubs';

  @override
  String get homeSortBy => 'Sort by';

  @override
  String get homePriceLowToHigh => 'Price Low to High';

  @override
  String get homeCoach => 'Coach';

  @override
  String get homeTrainWithCoach => 'Train with a Coach';

  @override
  String get homeDuration => 'Duration';

  @override
  String get homeDuration60Min => '60 min';

  @override
  String get homeDuration90Min => '90 min';

  @override
  String get homeDuration120Min => '120 min';

  @override
  String get homeType => 'Type';

  @override
  String get homeOutdoor => 'Outdoor';

  @override
  String get homeRoofed => 'Roofed';

  @override
  String get homeCancel => 'Cancel';

  @override
  String get homeApply => 'Apply';

  @override
  String get homeSort => 'Sort';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavCalendar => 'Calendar';

  @override
  String get homeNavProfile => 'Profile';

  @override
  String get homeNavTrophy => 'Trophy';

  @override
  String get homeNavMenu => 'Menu';

  @override
  String get homeCourtTabBooking => 'Booking';

  @override
  String get homeCourtTabCoaches => 'Coaches';

  @override
  String get homeCourtTabOpenMatch => 'Open Match';

  @override
  String get homeCourtTabCompetitions => 'Competitions';

  @override
  String get homeCourtTabCommunity => 'Community';

  @override
  String get homeCourtAmenityRacket => 'Racket';

  @override
  String get homeCourtAmenityBall => 'Ball';

  @override
  String get homeCourtAmenityShower => 'Shower';

  @override
  String get homeCourtAmenityToilet => 'Toilet';

  @override
  String get homeCourtAmenityWater => 'Water';

  @override
  String get homeCourtRating => 'Rating';

  @override
  String get homeCourtDistance => 'Distance';

  @override
  String get homeCourtZone => 'Zone';

  @override
  String get homeCourtBook => 'Book';

  @override
  String get homeCourtGetSubscriptionPack => 'Get Subscription Pack';

  @override
  String get homeBookingActivePackage => 'Active Package';

  @override
  String homeBookingSessions(int count) {
    return '$count Sessions';
  }

  @override
  String homeBookingSessionsLeft(int count) {
    return '$count Left';
  }

  @override
  String get homeBookingUse => 'Use';

  @override
  String get homeBookingReservationDate => 'Reservation date';

  @override
  String get homeBookingAvailable => 'Available';

  @override
  String get homeBookingBooked => 'Booked';

  @override
  String get homeBookingTimeslot => 'Timeslot';

  @override
  String homeBookingDurationMinutes(int minutes) {
    return '${minutes}min';
  }

  @override
  String get homeBookingChooseCourt => 'Choose a court';

  @override
  String get homeBookingCourtTypeLegend => 'A,C Indoor     B Outdoor';

  @override
  String get homeBookingCourtMixed => 'Mixed';

  @override
  String get homeBookingCourtLadiesOnly => 'Ladies Only';

  @override
  String get homeBookingCourtPrivate => 'Private';

  @override
  String get notFoundTitle => 'Page not found';

  @override
  String get notFoundMessage => 'The page you requested does not exist.';

  @override
  String get onboardingTitle => 'Athelete\'s\nPerfect\nHideaways';

  @override
  String get onboardingSubtitle =>
      'Lorem ipsum dolor sit amet, conse\nctetur adipiscing elit, sed do eiu\nsmod tempor incididunt ut labor\ne et dolore m';

  @override
  String get onboardingRating => '4.7';

  @override
  String get onboardingPlayersCount => 'from 1,800+ Players';

  @override
  String get getStarted => 'Get Started';

  @override
  String get accountLoginTitle => 'Account\nLogin';

  @override
  String get accountCreateTitle => 'Account\nCreate';

  @override
  String get mobileVerificationTitle => 'Mobile\nVerification';

  @override
  String get profileDetailsTitle => 'Profile\nDetails';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get mobileNoLabel => 'Mobile No.';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get nameLabel => 'Name';

  @override
  String get genderLabel => 'Gender';

  @override
  String get ageLabel => 'Age';

  @override
  String get demoEmailValue => 'hello@gmail.com';

  @override
  String get demoPasswordValue => 'password';

  @override
  String get maskedPasswordValue => '**********';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get loginNow => 'Login Now';

  @override
  String get newMember => 'New Member?';

  @override
  String get joinUs => 'Join Us';

  @override
  String get verificationPhoneNumber => '+966 52 8121948';

  @override
  String get wrongNumberChange => 'Wrong Number?Change';

  @override
  String get didntReceiveCodeResend => 'Didn\'t receive a code? Resend';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get skip => 'Skip';
}
