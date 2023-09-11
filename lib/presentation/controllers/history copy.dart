import 'package:dio_getx_clean/use_case/entities/history.dart';
import 'package:dio_getx_clean/use_case/services/history.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController with StateMixin<List<String>>{
     late HistoryService _historyService;
     late String code;
     

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
        change([] as List<String>?,status: RxStatus.loading());
        try {
           List<String> result = await _historyService.allHistory();
           change(result,status: RxStatus.success()); 
        } catch (e) {
            change([],status: RxStatus.error("Ocurrio un error Inesperado"));
        }
        
  }
  
  set setCode(String newCode){
     code = newCode;
  }
}