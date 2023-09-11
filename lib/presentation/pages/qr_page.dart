
import 'package:dio_getx_clean/di/log_notification.dart';
import 'package:dio_getx_clean/presentation/controllers/history.dart';
import 'package:dio_getx_clean/presentation/controllers/navigation.dart';
import 'package:dio_getx_clean/presentation/pages/history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io' show Platform;


class ScanQrPage extends StatefulWidget {
  const ScanQrPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {

  PageController pagecontroller = PageController(initialPage: 0);
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final HistoryController c = Get.find<HistoryController>();
  final NavigationRouterController router = Get.find<NavigationRouterController>();

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
    });
    Get.snackbar("QR Status", result?.code ?? "");
    c.saveQr(result?.code ?? "");
  }
  
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }
  void readQr() async {
    if (result != null) {
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    readQr();
    
    var size = MediaQuery.of(context).size;
    return Scaffold(
    bottomNavigationBar: BottomAppBar(
        color: Colors.black38,
        notchMargin: 6.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                    router.navigateToNamedUser();
                },
              ),
            ],
          ),
        ),
      ),  
    floatingActionButton: FloatingActionButton(child: const Icon(Icons.qr_code_2_outlined),onPressed: (){
      setState(() {
           NotificationService().showNotifications();
           pagecontroller.jumpToPage(1);
      });
    }),
      body: PageView(
        controller: pagecontroller,
        onPageChanged: (value) {
        },
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: HistoryView()
          ),
          QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.blueAccent,
          borderRadius: 10,
          borderLength: 50,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      )
        ],
      )
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}