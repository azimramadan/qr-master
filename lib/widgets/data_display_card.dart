import 'package:flutter/material.dart';
import 'package:qr_code_app/helpers/qr_code_handler.dart';

class DataDisplayCard extends StatelessWidget {
  const DataDisplayCard({
    super.key,
    required this.textList,
    required this.onCopyPressed,
  });
  final List<String> textList;
  final VoidCallback onCopyPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(59, 59, 59, 0.78),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Itim',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: onCopyPressed,
                    icon: Icon(
                      Icons.copy,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
            child: ListView.builder(
              shrinkWrap: true, // لجعل ListView تتكيف مع المحتوى
              physics:
                  NeverScrollableScrollPhysics(), // لمنع التمرير داخل ListView
              itemCount: textList.length, // عدد العناصر في القائمة
              itemBuilder: (context, index) {
                final text = textList[index];
                return GestureDetector(
                  onTap: () {
                    handleQrCodeData(text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Itim',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
