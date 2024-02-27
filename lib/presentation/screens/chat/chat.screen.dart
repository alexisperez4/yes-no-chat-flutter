import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {

                  return( index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
                  
              }),
            ),
        
            const SizedBox(height: 3),
            const MessageFieldBox(),
            const SizedBox(height: 4)
            

          ],
        ),
      ),
    );
  }
}
