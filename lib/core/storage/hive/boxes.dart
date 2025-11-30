/// Hive box names used throughout the application.
/// All box names should be defined here for centralized management.
class HiveBoxes {
  HiveBoxes._();

  /// Auth data box for storing user credentials and session.
  static const String authBox = 'auth_box';

  /// Home data box for caching home screen data.
  static const String homeDataBox = 'home_data_box';

  /// User preferences box.
  static const String preferencesBox = 'preferences_box';

  /// Location data box.
  static const String locationBox = 'location_box';
}
