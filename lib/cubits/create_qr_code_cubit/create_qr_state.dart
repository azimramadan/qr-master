part of 'create_qr_cubit.dart';

@immutable
sealed class CreateQrState {}

final class CreateQrInitial extends CreateQrState {}

final class LoadingState extends CreateQrState {}

final class SuccessState extends CreateQrState {}
