import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_app/constants.dart';
import 'package:qr_code_app/cubits/qr_history_cubit/qr_history_cubit.dart';
import 'package:qr_code_app/models/qr_model.dart';
import 'package:qr_code_app/pages/display_qr_code_page.dart';

class HistoryPageBody extends StatefulWidget {
  const HistoryPageBody({
    super.key,
  });

  @override
  State<HistoryPageBody> createState() => _HistoryPageBodyState();
}

class _HistoryPageBodyState extends State<HistoryPageBody> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _switchPage(int page) {
    setState(() {
      _currentPage = page;
    });
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الأزرار
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff333333),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: _currentPage == 0
                          ? Color(0xffFDB623)
                          : Color(0xff333333),
                    ),
                    onPressed: () => _switchPage(0),
                    child: Text(
                      'Scan',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: _currentPage == 1
                          ? Color(0xffFDB623)
                          : Color(0xff333333),
                    ),
                    onPressed: () => _switchPage(1),
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // PageView
        Expanded(
          child: BlocBuilder<QrHistoryCubitCubit, QrHistoryCubitState>(
            builder: (context, state) {
              List<QrModel> scanHistoryList =
                  BlocProvider.of<QrHistoryCubitCubit>(context)
                      .getFromScanBox();
              List<QrModel> createHistoryList =
                  BlocProvider.of<QrHistoryCubitCubit>(context)
                      .getFromCreateBox();

              return PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ListHistoryItem(
                      qrModelList: scanHistoryList,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ListHistoryItem(
                      qrModelList: createHistoryList,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class ListHistoryItem extends StatelessWidget {
  const ListHistoryItem({
    super.key,
    required this.qrModelList,
  });
  final List<QrModel> qrModelList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: BlocBuilder<QrHistoryCubitCubit, QrHistoryCubitState>(
        builder: (context, state) {
          return (qrModelList.isEmpty)
              ? Center(
                  child: Text(
                    'Empty',
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: qrModelList.length,
                  itemBuilder: (context, index) {
                    return HistoryItem(
                      qrModel: qrModelList[index],
                    );
                  },
                );
        },
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.qrModel,
  });
  final QrModel qrModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DisplayQrCodePage.pageName,
            arguments: [qrModel.qrData, qrModel.image]);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xff333333),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                'assets/images/branding.png',
                height: 40,
                width: 40,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          qrModel.qrData,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          qrModel.delete();
                          BlocProvider.of<QrHistoryCubitCubit>(context)
                              .getFromCreateBox();
                          BlocProvider.of<QrHistoryCubitCubit>(context)
                              .getFromScanBox();
                        },
                        child: Icon(
                          Icons.delete_forever,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'data',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA4A4A4),
                        ),
                      ),
                      Text(
                        qrModel.date,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffA4A4A4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
