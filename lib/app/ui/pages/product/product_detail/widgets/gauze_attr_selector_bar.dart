/*
 * @Description: 选择窗纱
 * @Author: iamsmiling
 * @Date: 2020-12-24 15:49:39
 * @LastEditTime: 2020-12-28 10:42:20
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taojuwu/app/ui/pages/product/product_detail/utils/curtain_product_attr_selector_kit.dart';

import 'package:taojuwu/app/domain/model/product/curtain_product_attr_model.dart';

import '../product_key.dart';

class GauzeAttrSelectorBar<T extends BaseCurtainProductAttrsSelectorController>
    extends StatelessWidget {
  final T controller;
  const GauzeAttrSelectorBar({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: ProductKey.gauze,
      builder: (_) {
        return GestureDetector(
          onTap: () =>
              CurtainProductAttrSelectorKit.selectGauze(context, controller)
                  .whenComplete(() => _.update([
                        ProductKey.gauze,
                        ProductKey.craft,
                        ProductKey.sectionalBar
                      ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(_.gauze.typeName), Text(_.gauze.currentOptionName)],
          ),
        );
      },
    );
  }
}
