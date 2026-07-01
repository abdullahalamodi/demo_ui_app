// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق واجهة تجريبي';

  @override
  String get homeTitle => 'تم تجهيز أساس الواجهة';

  @override
  String get homeMessage =>
      'ابدأ بإضافة شاشات الميزات مع نصوص مترجمة ونماذج عرض تجريبية وودجات قابلة لإعادة الاستخدام ومسارات go_router.';

  @override
  String get homeReadyTitle => 'تم تهيئة قواعد الدليل';

  @override
  String get homeReadyMessage =>
      'تم تجهيز هيكل التطبيق والثيم والمسارات والترجمة والودجات المشتركة ومجلدات الميزات.';

  @override
  String get notFoundTitle => 'الصفحة غير موجودة';

  @override
  String get notFoundMessage => 'الصفحة المطلوبة غير موجودة.';
}
