import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

part 'create_qr_state.dart';

class CreateQrCubit extends Cubit<CreateQrState> {
  CreateQrCubit() : super(CreateQrInitial());
  Future<Uint8List> getQRImage(data) async {
    emit(LoadingState());
    final qrCode = QrCode.fromData(
      data: data.join('\n'),
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    final qrImage = QrImage(
      qrCode,
    );
    final qrImageBytes = await qrImage.toImageAsBytes(
      size: 512,
      format: ImageByteFormat.png,
      decoration: const PrettyQrDecoration(
        background: Color.fromRGBO(217, 217, 217, 1),
      ),
    );
    final qrImageUint8List = qrImageBytes!.buffer.asUint8List();
    emit(SuccessState());
    return qrImageUint8List;
  }
}
