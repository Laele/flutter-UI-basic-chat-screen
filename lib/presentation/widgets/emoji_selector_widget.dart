// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EmojiSelector extends StatelessWidget {

  final VoidCallback emojiReaction1;
  final VoidCallback emojiReaction2;
  final VoidCallback emojiReaction3;
  final VoidCallback emojiRemove;

  EmojiSelector({
    Key? key,
    required this.emojiReaction1, 
    required this.emojiReaction2, 
    required this.emojiReaction3, 
    required this.emojiRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          //width: double.maxFinite,
          //constraints: BoxConstraints.expand(width: double., height: 100),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(45.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SlideInUp(
                from: 15,
                duration: const Duration(milliseconds: 50),
                child: IconButton(
                  onPressed: emojiReaction1,
                  icon: const Icon(Icons.emoji_emotions, color: Colors.red,),
                  style: IconButton.styleFrom(backgroundColor: Colors.blue.shade300),
                ),
              ),
                          
              SlideInUp(
                from: 10,
                duration: const Duration(milliseconds: 50),
                child: IconButton(
                  onPressed: emojiReaction2,
                  icon: const Icon(Icons.emoji_emotions, color: Colors.purple,),
                  style: IconButton.styleFrom(backgroundColor: Colors.blue.shade300),
                ),
              ),

              SlideInUp(
                from: 5,
                duration: const Duration(milliseconds: 50),
                child: IconButton(
                  onPressed: emojiReaction3,
                  icon: const Icon(Icons.emoji_emotions, color: Colors.green,),
                  style: IconButton.styleFrom(backgroundColor: Colors.blue.shade300),
                ),
              ),

              IconButton(
                onPressed: emojiRemove,
                icon: const Icon(Icons.cancel_outlined, color: Colors.red,),
                style: IconButton.styleFrom(backgroundColor: Colors.blue.shade300),
              ),
            ],
          ),
        ),
      ]
    );
  }
}
