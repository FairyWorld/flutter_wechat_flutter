import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:wechat_flutter/ui/message_view/msg_avatar.dart';
import 'package:wechat_flutter/ui/message_view/text_item_container.dart';

import '../../provider/global_model.dart';

class TextMsg extends StatelessWidget {
  const TextMsg(this.text, this.model, {super.key});

  final String text;
  final V2TimMessage model;

  @override
  Widget build(BuildContext context) {
    final GlobalModel globalModel = Provider.of<GlobalModel>(context);
    List<Widget> body = <Widget>[
      MsgAvatar(model: model, globalModel: globalModel),
      TextItemContainer(
        text: text ?? '文字为空',
        action: '',
        isMyself: model.id == globalModel.account,
      ),
      const Spacer(),
    ];
    if (model.id == globalModel.account) {
      body = body.reversed.toList();
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: body),
    );
  }
}
