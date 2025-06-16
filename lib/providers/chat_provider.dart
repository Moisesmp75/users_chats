import 'package:flutter/material.dart';
import 'package:users_app/models/message.dart';
import 'package:users_app/services/yes_no_api_service.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final YesNoApiService getYesNoAnswer = YesNoApiService();

  final Map<int, List<Message>> _userChats = {};

  int? _activeUserId;

  void loadChatForUser(int userId) {
    _activeUserId = userId;

    _userChats.putIfAbsent(userId, () => []);

    notifyListeners();
  }

  List<Message> get messages => _userChats[_activeUserId] ?? [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty || _activeUserId == null) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    _userChats[_activeUserId!]!.add(newMessage);

    notifyListeners();
    moveScrollToBottom();

    if (text.trim().endsWith('?')) {
      await herReply();
    }
  }

  Future<void> herReply() async {
    if (_activeUserId == null) return;

    final herMessage = await getYesNoAnswer.getAnswer();
    _userChats[_activeUserId!]!.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (!chatScrollController.hasClients) return;

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
