import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/cubits/create_qr_code_cubit/create_qr_cubit.dart';
import 'package:qr_code_app/cubits/qr_history_cubit/qr_history_cubit.dart';
import 'package:qr_code_app/models/qr_model.dart';
import 'package:qr_code_app/pages/display_qr_code_page.dart';
import 'package:qr_code_app/widgets/custom_text_field.dart';
import 'package:qr_code_app/widgets/generate_code_page_body.dart';
import 'package:qr_code_app/widgets/generate_qr_code_button.dart';
import 'package:qr_code_app/widgets/text_lable_widgget.dart';

class QRCodeFormFields extends StatefulWidget {
  const QRCodeFormFields({
    super.key,
    required this.arguments,
  });

  final String arguments;

  @override
  State<QRCodeFormFields> createState() => _QRCodeFormFieldsState();
}

class _QRCodeFormFieldsState extends State<QRCodeFormFields> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconsInfo[widget.arguments] is IconData
                ? Icon(
                    iconsInfo[widget.arguments],
                    color: kPrimaryColor,
                    size: 75,
                  )
                : Image.asset(
                    iconsInfo[widget.arguments],
                    scale: 2,
                  ),
            SizedBox(
              height: 15,
            ),
            buildTextFieldWithLabel(),
            SizedBox(
              height: 25,
            ),
            GenerateQRCodeButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final image = await BlocProvider.of<CreateQrCubit>(context)
                      .getQRImage(data);

                  widget.arguments == 'WhatsApp'
                      ? data[0] = 'https://wa.me/${data[0]}'
                      : data;

                  BlocProvider.of<QrHistoryCubitCubit>(context).addInCreateBox(
                    QrModel(
                      image,
                      date: DateFormat().add_yMEd().format(
                            DateTime.now(),
                          ),
                      qrData: data.toString(),
                    ),
                  );
                  Navigator.pushNamed(context, DisplayQrCodePage.pageName,
                      arguments: [data, image]);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldWithLabel() {
    if (widget.arguments == 'Phone' ||
        widget.arguments == 'Instagram' ||
        widget.arguments == 'Twitter' ||
        widget.arguments == 'Email' ||
        widget.arguments == 'Website' ||
        widget.arguments == 'WhatsApp' ||
        widget.arguments == 'Text' ||
        widget.arguments == 'Location') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLableWidget(
            lable: getLable(widget.arguments),
          ),
          CustomTextField(
            hintText: getHintText(widget.arguments),
            onSaved: (value) {
              data.add(value!);
            },
          ),
        ],
      );
    } else if (widget.arguments == 'Wi-Fi') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLableWidget(lable: 'Network'),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter network name',
          ),
          TextLableWidget(lable: 'Password'),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter password',
          ),
        ],
      );
    } else if (widget.arguments == 'Event') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLableWidget(
            lable: 'Event Name',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter name',
          ),
          TextLableWidget(
            lable: 'Start Date and Time',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: '12 Dec 2022, 10:40 pm',
          ),
          TextLableWidget(
            lable: 'End Date and Time',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: '12 Dec 2022, 10:40 pm',
          ),
          TextLableWidget(
            lable: 'Event Location',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter location',
          ),
          TextLableWidget(
            lable: 'Description',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            maxLines: 2,
            hintText: 'Enter any details',
          ),
        ],
      );
    } else if (widget.arguments == 'Contact') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLableWidget(
            lable: 'Name',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter Name',
          ),
          TextLableWidget(
            lable: 'Company',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter company',
          ),
          TextLableWidget(
            lable: 'Email',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter Email',
          ),
          TextLableWidget(
            lable: 'Website',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter Website',
          ),
          TextLableWidget(
            lable: 'Address',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter address',
          ),
        ],
      );
    } else if (widget.arguments == 'Business') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLableWidget(
            lable: 'Company Name',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter Name',
          ),
          TextLableWidget(
            lable: 'Industry',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'e.g Food/Agency',
          ),
          TextLableWidget(
            lable: 'Email',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter Email',
          ),
          TextLableWidget(
            lable: 'Phone',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter phone',
          ),
          TextLableWidget(
            lable: 'Website',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter websites',
          ),
          TextLableWidget(
            lable: 'Address',
          ),
          CustomTextField(
            onSaved: (value) {
              data.add(value!);
            },
            hintText: 'Enter address',
          ),
        ],
      );
    } else {
      return Text('');
    }
  }

  String getLable(String value) {
    return value == 'Text'
        ? value
        : value == 'Phone'
            ? '$value Number'
            : (value == 'Instagram' || value == 'Twitter')
                ? 'Username'
                : value == 'Email'
                    ? value
                    : value == 'Website'
                        ? '$value URL'
                        : value == 'Location'
                            ? 'Location'
                            : '$value Number';
  }

  String getHintText(String value) {
    return value == 'Text'
        ? 'Enter text'
        : value == 'Phone'
            ? '+92xxxxxxxxxx'
            : (value == 'Instagram' || value == 'Twitter')
                ? 'Enter ${value.toLowerCase()} username'
                : value == 'Email'
                    ? 'Enter email address'
                    : value == 'Website'
                        ? 'www.qrcode.com'
                        : value == 'Location'
                            ? 'Enter location URL'
                            : 'Enter number';
  }
}
