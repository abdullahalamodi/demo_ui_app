import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Demo UI App'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'UI foundation is ready'**
  String get homeTitle;

  /// No description provided for @homeMessage.
  ///
  /// In en, this message translates to:
  /// **'Start adding feature screens with localized strings, demo UI models, reusable widgets, and go_router routes.'**
  String get homeMessage;

  /// No description provided for @homeReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Guide conventions initialized'**
  String get homeReadyTitle;

  /// No description provided for @homeReadyMessage.
  ///
  /// In en, this message translates to:
  /// **'The app shell, theme, routing, localization, shared widgets, and feature-first folders are in place.'**
  String get homeReadyMessage;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get homeWelcomeBack;

  /// No description provided for @homeSettingsAction.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get homeSettingsAction;

  /// No description provided for @homeNotificationsAction.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeNotificationsAction;

  /// No description provided for @homeSearchResults.
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get homeSearchResults;

  /// No description provided for @homeCourtCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Court'**
  String homeCourtCount(int count);

  /// No description provided for @homeSavedAction.
  ///
  /// In en, this message translates to:
  /// **'Saved venues'**
  String get homeSavedAction;

  /// No description provided for @homeShareAction.
  ///
  /// In en, this message translates to:
  /// **'Share venue'**
  String get homeShareAction;

  /// No description provided for @homeSelectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get homeSelectCity;

  /// No description provided for @homeNearest.
  ///
  /// In en, this message translates to:
  /// **'Nearest'**
  String get homeNearest;

  /// No description provided for @homeIndoor.
  ///
  /// In en, this message translates to:
  /// **'Indoor'**
  String get homeIndoor;

  /// No description provided for @homeAvailableTimeslots.
  ///
  /// In en, this message translates to:
  /// **'Available Timeslots'**
  String get homeAvailableTimeslots;

  /// No description provided for @homeFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get homeFilter;

  /// No description provided for @homeFilterResults.
  ///
  /// In en, this message translates to:
  /// **'Filter Results'**
  String get homeFilterResults;

  /// No description provided for @homeAvailability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get homeAvailability;

  /// No description provided for @homeShowNonAvailableClubs.
  ///
  /// In en, this message translates to:
  /// **'Show Non Available Clubs'**
  String get homeShowNonAvailableClubs;

  /// No description provided for @homeSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get homeSortBy;

  /// No description provided for @homePriceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price Low to High'**
  String get homePriceLowToHigh;

  /// No description provided for @homeCoach.
  ///
  /// In en, this message translates to:
  /// **'Coach'**
  String get homeCoach;

  /// No description provided for @homeTrainWithCoach.
  ///
  /// In en, this message translates to:
  /// **'Train with a Coach'**
  String get homeTrainWithCoach;

  /// No description provided for @homeDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get homeDuration;

  /// No description provided for @homeDuration60Min.
  ///
  /// In en, this message translates to:
  /// **'60 min'**
  String get homeDuration60Min;

  /// No description provided for @homeDuration90Min.
  ///
  /// In en, this message translates to:
  /// **'90 min'**
  String get homeDuration90Min;

  /// No description provided for @homeDuration120Min.
  ///
  /// In en, this message translates to:
  /// **'120 min'**
  String get homeDuration120Min;

  /// No description provided for @homeType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get homeType;

  /// No description provided for @homeOutdoor.
  ///
  /// In en, this message translates to:
  /// **'Outdoor'**
  String get homeOutdoor;

  /// No description provided for @homeRoofed.
  ///
  /// In en, this message translates to:
  /// **'Roofed'**
  String get homeRoofed;

  /// No description provided for @homeCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get homeCancel;

  /// No description provided for @homeApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get homeApply;

  /// No description provided for @homeSort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get homeSort;

  /// No description provided for @homeNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNavHome;

  /// No description provided for @homeNavCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get homeNavCalendar;

  /// No description provided for @homeNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get homeNavProfile;

  /// No description provided for @homeNavTrophy.
  ///
  /// In en, this message translates to:
  /// **'Trophy'**
  String get homeNavTrophy;

  /// No description provided for @homeNavMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get homeNavMenu;

  /// No description provided for @homeCourtTabBooking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get homeCourtTabBooking;

  /// No description provided for @homeCourtTabCoaches.
  ///
  /// In en, this message translates to:
  /// **'Coaches'**
  String get homeCourtTabCoaches;

  /// No description provided for @homeCourtTabOpenMatch.
  ///
  /// In en, this message translates to:
  /// **'Open Match'**
  String get homeCourtTabOpenMatch;

  /// No description provided for @homeCourtTabCompetitions.
  ///
  /// In en, this message translates to:
  /// **'Competitions'**
  String get homeCourtTabCompetitions;

  /// No description provided for @homeCourtTabCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get homeCourtTabCommunity;

  /// No description provided for @homeCourtAmenityRacket.
  ///
  /// In en, this message translates to:
  /// **'Racket'**
  String get homeCourtAmenityRacket;

  /// No description provided for @homeCourtAmenityBall.
  ///
  /// In en, this message translates to:
  /// **'Ball'**
  String get homeCourtAmenityBall;

  /// No description provided for @homeCourtAmenityShower.
  ///
  /// In en, this message translates to:
  /// **'Shower'**
  String get homeCourtAmenityShower;

  /// No description provided for @homeCourtAmenityToilet.
  ///
  /// In en, this message translates to:
  /// **'Toilet'**
  String get homeCourtAmenityToilet;

  /// No description provided for @homeCourtAmenityWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get homeCourtAmenityWater;

  /// No description provided for @homeCourtRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get homeCourtRating;

  /// No description provided for @homeCourtDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get homeCourtDistance;

  /// No description provided for @homeCourtZone.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get homeCourtZone;

  /// No description provided for @homeCourtBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get homeCourtBook;

  /// No description provided for @homeCourtGetSubscriptionPack.
  ///
  /// In en, this message translates to:
  /// **'Get Subscription Pack'**
  String get homeCourtGetSubscriptionPack;

  /// No description provided for @homeBookingActivePackage.
  ///
  /// In en, this message translates to:
  /// **'Active Package'**
  String get homeBookingActivePackage;

  /// No description provided for @homeBookingSessions.
  ///
  /// In en, this message translates to:
  /// **'{count} Sessions'**
  String homeBookingSessions(int count);

  /// No description provided for @homeBookingSessionsLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} Left'**
  String homeBookingSessionsLeft(int count);

  /// No description provided for @homeBookingUse.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get homeBookingUse;

  /// No description provided for @homeBookingReservationDate.
  ///
  /// In en, this message translates to:
  /// **'Reservation date'**
  String get homeBookingReservationDate;

  /// No description provided for @homeBookingAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get homeBookingAvailable;

  /// No description provided for @homeBookingBooked.
  ///
  /// In en, this message translates to:
  /// **'Booked'**
  String get homeBookingBooked;

  /// No description provided for @homeBookingTimeslot.
  ///
  /// In en, this message translates to:
  /// **'Timeslot'**
  String get homeBookingTimeslot;

  /// No description provided for @homeBookingDurationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}min'**
  String homeBookingDurationMinutes(int minutes);

  /// No description provided for @homeBookingChooseCourt.
  ///
  /// In en, this message translates to:
  /// **'Choose a court'**
  String get homeBookingChooseCourt;

  /// No description provided for @homeBookingCourtTypeLegend.
  ///
  /// In en, this message translates to:
  /// **'A,C Indoor     B Outdoor'**
  String get homeBookingCourtTypeLegend;

  /// No description provided for @homeBookingCourtMixed.
  ///
  /// In en, this message translates to:
  /// **'Mixed'**
  String get homeBookingCourtMixed;

  /// No description provided for @homeBookingCourtLadiesOnly.
  ///
  /// In en, this message translates to:
  /// **'Ladies Only'**
  String get homeBookingCourtLadiesOnly;

  /// No description provided for @homeBookingCourtPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get homeBookingCourtPrivate;

  /// No description provided for @notFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundTitle;

  /// No description provided for @notFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The page you requested does not exist.'**
  String get notFoundMessage;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Athelete\'s\nPerfect\nHideaways'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, conse\nctetur adipiscing elit, sed do eiu\nsmod tempor incididunt ut labor\ne et dolore m'**
  String get onboardingSubtitle;

  /// No description provided for @onboardingRating.
  ///
  /// In en, this message translates to:
  /// **'4.7'**
  String get onboardingRating;

  /// No description provided for @onboardingPlayersCount.
  ///
  /// In en, this message translates to:
  /// **'from 1,800+ Players'**
  String get onboardingPlayersCount;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @accountLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Account\nLogin'**
  String get accountLoginTitle;

  /// No description provided for @accountCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Account\nCreate'**
  String get accountCreateTitle;

  /// No description provided for @mobileVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile\nVerification'**
  String get mobileVerificationTitle;

  /// No description provided for @profileDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile\nDetails'**
  String get profileDetailsTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get emailLabel;

  /// No description provided for @mobileNoLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile No.'**
  String get mobileNoLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @genderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderLabel;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageLabel;

  /// No description provided for @demoEmailValue.
  ///
  /// In en, this message translates to:
  /// **'hello@gmail.com'**
  String get demoEmailValue;

  /// No description provided for @demoPasswordValue.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get demoPasswordValue;

  /// No description provided for @maskedPasswordValue.
  ///
  /// In en, this message translates to:
  /// **'**********'**
  String get maskedPasswordValue;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @loginNow.
  ///
  /// In en, this message translates to:
  /// **'Login Now'**
  String get loginNow;

  /// No description provided for @newMember.
  ///
  /// In en, this message translates to:
  /// **'New Member?'**
  String get newMember;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join Us'**
  String get joinUs;

  /// No description provided for @verificationPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'+966 52 8121948'**
  String get verificationPhoneNumber;

  /// No description provided for @wrongNumberChange.
  ///
  /// In en, this message translates to:
  /// **'Wrong Number?Change'**
  String get wrongNumberChange;

  /// No description provided for @didntReceiveCodeResend.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive a code? Resend'**
  String get didntReceiveCodeResend;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
