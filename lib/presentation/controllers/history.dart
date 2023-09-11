import 'package:dio_getx_clean/use_case/entities/history.dart';
import 'package:dio_getx_clean/use_case/services/history.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController{
     late HistoryService _historyService;
     late String code;
     RxList<String> qrhistory = RxList([]);

  @override
  void onInit() async {
    _historyService = Get.find<HistoryService>();
    fetchHistory();
    super.onInit();
  }

  saveQr(String code){
    HistoryDto historyDto = HistoryDto(code: code);
    _historyService.registerHistory(historyDto);
  }

  void fetchHistory() async {
        List<String> result = await _historyService.allHistory(); 
        qrhistory.value = result;
  }
  
  set setCode(String newCode){
     code = newCode;
  }
}