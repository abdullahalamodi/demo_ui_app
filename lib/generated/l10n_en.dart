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
  String get notFoundTitle => 'Page not found';

  @override
  String get notFoundMessage => 'The page you requested does not exist.';
}
