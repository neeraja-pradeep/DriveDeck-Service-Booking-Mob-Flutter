import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/booking_confirmation.dart';
import '../../domain/entities/booking_status.dart';

part 'booking_confirmation_model.freezed.dart';
part 'booking_confirmation_model.g.dart';

/// Model for booking confirmation API response.
@freezed
class BookingConfirmationModel with _$BookingConfirmationModel {
  const BookingConfirmationModel._();

  const factory BookingConfirmationModel({
    @JsonKey(name: 'booking_id') required String bookingId,
    @JsonKey(name: 'booking_reference') required String bookingReference,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _BookingConfirmationModel;

  factory BookingConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$BookingConfirmationModelFromJson(json);

  /// Converts to domain entity.
  BookingConfirmation toDomain() => BookingConfirmation(
        bookingId: bookingId,
        bookingReference: bookingReference,
        status: BookingStatusX.fromApiValue(status),
        createdAt: DateTime.parse(createdAt),
      );
}
