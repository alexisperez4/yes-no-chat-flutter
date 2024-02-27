import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://resizing.flixster.com/JseJ1s6oQEg-Fy0fvPvvgKlXBLs=/300x300/v2/http://media.baselineresearch.com/images/1200503/1200503_full.jpg'),
          ),
        ),
        title: const Text('Mi amor ♥'),
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
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return ( message.fromWho == FromWho.hers )
                    ? HerMessageBubble(message: message) 
                    : MyMessageBubble(message: message);
              }),
            ),
        
            const SizedBox(height: 3),
            
            // Caja de texto de mensajes
            MessageFieldBox( 
              onValue: chatProvider.sendMessage, // Es lo mismo que escribir ===> onValue: (value) => chatProvider.sendMessage(value),
            ),
            const SizedBox(height: 4)
            
          ],
        ),
      ),
    );
  }
}
