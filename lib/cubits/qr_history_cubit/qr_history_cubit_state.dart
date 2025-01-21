part of 'qr_history_cubit.dart';

@immutable
sealed class QrHistoryCubitState {}

final class QrHistoryCubitInitial extends QrHistoryCubitState {}

final class QrHistoryCubSuccess extends QrHistoryCubitState {}

final class QrHistoryCubitFailure extends QrHistoryCubitState {
  final String errorMassege;
  QrHistoryCubitFailure({required this.errorMassege});
}
