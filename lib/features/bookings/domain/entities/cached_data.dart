import 'package:equatable/equatable.dart';

/// Wrapper class for cached data with timestamp.
///
/// Used to track when data was last fetched for conditional requests.
class CachedData<T> extends Equatable {
  /// Creates a new [CachedData] instance.
  const CachedData({
    required this.data,
    required this.lastModified,
  });

  /// The cached data.
  final T data;

  /// Timestamp when the data was last modified/fetched.
  final DateTime lastModified;

  /// Returns the formatted last modified string for HTTP headers.
  String get lastModifiedHeader {
    // Format: Sun, 26 Oct 2025 09:51:00 GMT
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final utc = lastModified.toUtc();
    final weekday = weekdays[utc.weekday - 1];
    final day = utc.day.toString().padLeft(2, '0');
    final month = months[utc.month - 1];
    final year = utc.year;
    final hour = utc.hour.toString().padLeft(2, '0');
    final minute = utc.minute.toString().padLeft(2, '0');
    final second = utc.second.toString().padLeft(2, '0');

    return '$weekday, $day $month $year $hour:$minute:$second GMT';
  }

  /// Creates a copy of this [CachedData] with the given fields replaced.
  CachedData<T> copyWith({
    T? data,
    DateTime? lastModified,
  }) {
    return CachedData<T>(
      data: data ?? this.data,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  @override
  List<Object?> get props => [data, lastModified];
}
