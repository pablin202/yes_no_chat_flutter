import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_flutter_app/domain/entities/message.dart';
import 'package:yes_no_flutter_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_flutter_app/presentation/widgets/her_message_bubble.dart';
import 'package:yes_no_flutter_app/presentation/widgets/my_message_bubble.dart';
import 'package:yes_no_flutter_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _ChatAppBar(),
      body: _ChatView(),
    );
  }
}

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ChatAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmR4hqMCbhQxm9HJYkPlh-W-fZKJ6sqehuMg&usqp=CAU'),
        ),
      ),
      title: const Text('Tony Stark'),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(child: ListView.builder(
            controller: chatProvider.chatScrollCtrl,
            itemCount: chatProvider.messages.length, itemBuilder: (context, index) {
            final msg = chatProvider.messages[index];
            return (msg.fromWho == FromWho.his) ? HerMessageBubble(message: msg): MyMessageBubble(message: msg);
          })
          ),
          MessageFieldBox(onValue: (value) {
            chatProvider.sendMessage(value); 
          })
        ]),
      ),
    );
  }
}