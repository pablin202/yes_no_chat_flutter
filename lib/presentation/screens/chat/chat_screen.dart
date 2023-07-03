import 'package:flutter/material.dart';
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
      title: const Text('Hola'),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(children: [
          Expanded(child: ListView.builder(itemCount: 100, itemBuilder: (context, index) {
            return (index % 2 ==0) ? const HerMessageBubble(): const MyMessageBubble();
          })
          ),
          const MessageFieldBox()
        ]),
      ),
    );
  }
}