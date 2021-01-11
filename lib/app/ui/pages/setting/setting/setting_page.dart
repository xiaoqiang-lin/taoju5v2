/*
 * @Description: 设置页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:53:48
 * @LastEditTime: 2021-01-10 15:45:17
 */
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taojuwu/app/res/x_dimens.dart';
import 'package:taojuwu/app/routes/app_pages.dart';
import 'package:taojuwu/app/ui/pages/setting/setting/setting_controller.dart';

import 'fragment/setting_header.dart';
import 'widget/x_label_tile.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: GetBuilder<SettingController>(builder: (_) {
        return Column(
          children: [
            SettingHeader(),
            XLabelTile(
              label: "清除缓存",
              trailing: Text(_.cacheSize),
              onTap: _.clearCache,
            ),
            Divider(),
            XLabelTile(
              label: "重置密码",
            ),
            Divider(
              height: XDimens.gap16,
            ),
            XLabelTile(
              label: "问题反馈",
            ),
            Divider(),
            XLabelTile(
              label: "用户协议",
              onTap: () => Get.toNamed(AppRoutes.userProtocol),
            ),
            Divider(),
            XLabelTile(
              label: "关于淘居屋",
              trailing: Text(_.versionCode),
            ),
            TextButton(onPressed: _.logOut, child: Text("退出"))
          ],
        );
      }),
    );
  }
}
