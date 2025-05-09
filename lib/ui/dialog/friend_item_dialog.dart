import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_flutter/im/friend_handle.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';

import 'confirm_alert.dart';

friendItemDialog(BuildContext context,
    {required String userId, required OnSuCc suCc}) {
  action(v) {
    Navigator.of(context).pop();
    if (v == '删除') {
      confirmAlert(
        context,
        (bool) {
          if (bool) {
            delFriend(userId, context, suCc: (v) => suCc(v));
          }
        },
        tips: '你确定要删除此联系人吗',
        okBtn: '删除',
        warmStr: '删除联系人',
        isWarm: true,
        style: TextStyle(fontWeight: FontWeight.w500),
      );
    } else {
      showToast('删除功能是好的');
    }
  }

  Widget item(String item) {
    return new Container(
      width: Get.width,
      decoration: BoxDecoration(
        border: item != '删除'
            ? Border(
                bottom: BorderSide(color: lineColor, width: 0.2),
              )
            : null,
      ),
      child: new TextButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15.0)),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () => action(item),
        child: new Text(item),
      ),
    );
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      List<String> data = [
        '设置备注和标签',
        '把她推荐给朋友',
        '设为星标好友',
        '设置朋友圈和视频动态权限',
        '加入黑名单',
        '投诉',
        '添加到桌面',
        '删除',
      ];

      return new Center(
        child: new Material(
          type: MaterialType.transparency,
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new InkWell(
                  child: new Container(),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              new ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new Column(children: data.map(item).toList()),
                      new HorizontalLine(color: appBarColor, height: 10.0),
                      new TextButton(
                        style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 15.0)),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        onPressed: () => Navigator.of(context).pop(),
                        child: new Container(
                          width: Get.width,
                          alignment: Alignment.center,
                          child: new Text('取消'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
