import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/models/message.dart';
import 'package:users_app/models/user.dart';
import 'package:go_router/go_router.dart';
import 'package:users_app/providers/chat_provider.dart';
import 'package:users_app/widgets/her_message_bubble.dart';
import 'package:users_app/widgets/message_field_box.dart';
import 'package:users_app/widgets/my_message_bubble.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatProvider = context.read<ChatProvider>();
      chatProvider.loadChatForUser(user.id);
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios)
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
              onBackgroundImageError: (exception, stackTrace) {
              }
            ),
            SizedBox(width: 20,),
            Text("${user.firstName} ${user.lastName}"),
          ],
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  switch (message.fromWho) {
                    case FromWho.me: return MyMessageBubble(message: message.text);
                    case FromWho.hers: return HerMessageBubble(message: message);
                  }
                }
              ),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}