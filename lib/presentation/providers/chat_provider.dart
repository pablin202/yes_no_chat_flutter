import 'package:flutter/material.dart';
import 'package:yes_no_flutter_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_flutter_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final chatScrollCtrl = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hi Tony', fromWho: FromWho.me)
  ];

  Future<void> hisReply() async {
    final hisMsg = await getYesNoAnswer.getAnswer();
    messages.add(hisMsg);
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      await hisReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void>  moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollCtrl.animateTo(chatScrollCtrl.position.maxScrollExtent, duration: const Duration(microseconds: 300), curve: Curves.easeOut);
  }
}