import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/cubits/create_qr_code_cubit/create_qr_cubit.dart';

class GenerateQRCodeButton extends StatelessWidget {
  const GenerateQRCodeButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateQrCubit, CreateQrState>(
      builder: (context, state) {
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: state is LoadingState
              ? CircularProgressIndicator()
              : Text(
                  'Generate QR Code',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        );
      },
    );
  }
}
