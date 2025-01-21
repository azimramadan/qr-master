import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:qr_code_app/models/qr_model.dart';

part 'qr_history_cubit_state.dart';

class QrHistoryCubitCubit extends Cubit<QrHistoryCubitState> {
  QrHistoryCubitCubit() : super(QrHistoryCubitInitial());
  addInScanBox(QrModel qrModel) async {
    try {
      var qrHistoryBox = Hive.box<QrModel>('qrScanBox');
      await qrHistoryBox.add(qrModel);
      emit(QrHistoryCubSuccess());
    } catch (e) {
      emit(QrHistoryCubitFailure(errorMassege: e.toString()));
    }
  }

  addInCreateBox(QrModel qrModel) async {
    try {
      var qrHistoryBox = Hive.box<QrModel>('qrCreateBox');
      await qrHistoryBox.add(qrModel);
      emit(QrHistoryCubSuccess());
    } catch (e) {
      emit(QrHistoryCubitFailure(errorMassege: e.toString()));
    }
  }

  List<QrModel> getFromCreateBox() {
    var qrHistoryBox = Hive.box<QrModel>('qrCreateBox');
    emit(QrHistoryCubSuccess());
    return qrHistoryBox.values.toList();
  }

  List<QrModel> getFromScanBox() {
    var qrHistoryBox = Hive.box<QrModel>('qrScanBox');
    emit(QrHistoryCubSuccess());
    return qrHistoryBox.values.toList();
  }
}
