/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:28:37
 * @LastEditTime: 2020-12-22 15:45:06
 */
import 'package:get/get.dart';
import 'package:taojuwu/app/domain/model/customer/customer_detail_model.dart';
import 'package:taojuwu/app/domain/repository/customer/customer_repository.dart';
import 'package:taojuwu/app/ui/widgets/base/x_view_state.dart';

class CustomerDetailController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  XLoadState loadState = XLoadState.idle;

  CustomerDetailModel customer;

  Future<CustomerDetailModel> loadData() {
    loadState = XLoadState.busy;
    final id = Get.parameters["id"];
    return _repository
        .customerDetail(params: {"id": id}).then((CustomerDetailModel model) {
      customer = model;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}

extension CustomerAddressModelKit on CustomerAddressModel {
  String get concreteAddress => GetUtils.isNullOrBlank(provinceName)
      ? ""
      : "$provinceName/$cityName/$districtName${GetUtils.isNullOrBlank(detailAddress) ? "" : detailAddress}";
}

extension CustomerDetailModelKit on CustomerDetailModel {
  String get concreteAddress => address.concreteAddress;
}
