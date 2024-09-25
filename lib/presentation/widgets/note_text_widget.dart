// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animations/presentation/widgets/emoji_selector_widget.dart';

class NoteText extends StatefulWidget {
  final int num;
  final String text;
  final GlobalKey<AnimatedListState> animatedListKey;
  final List<Widget> noteTexts;
  final List<Icon> emojis = [ 
    const Icon(Icons.face, color: Colors.pink, size: 18,), 
    const Icon(Icons.face, color:Colors.purple, size: 18,), 
    const Icon(Icons.face, color: Colors.green, size: 18,)
  ] ;
  late AnimationController controller;
  int emojiIndex = 0;
  bool deleted = false;
  bool reacted = false;

  NoteText({
    Key? key,
    required this.num,
    required this.text,
    required this.animatedListKey,
    required this.noteTexts,
  }) : super(key: key);

  @override
  State<NoteText> createState() => _NoteTextState();
}



class _NoteTextState extends State<NoteText> {
  
@override
void dispose() {
  super.dispose();
  widget.controller.dispose();
}
  
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShakeY(
              animate: selected,
              from: 2,
              curve: Curves.bounceIn,
              infinite: selected,
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: !widget.deleted
                    ? Badge(
                        isLabelVisible: widget.reacted,
                        backgroundColor: Colors.white,
                        offset: const Offset(-10, -5),
                        label: widget.emojis[widget.emojiIndex],
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.only(
                              right: 20.0,
                              left: 20.0,
                              top: 10.0,
                              bottom: 10.0),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45.0)),
                              color: Colors.blue),
                          child: Text(
                            widget.text,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(45.0)),
                            color: Colors.grey),
                        child: const Text(
                          'Mensaje Eliminado.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
              ),
            ),
            if (selected)
              IconButton(
                  onPressed: () {
                    widget.deleted = true;
                    selected = false;
                    setState(() {});
                    //this.widget.text = ''
                    //widget.noteTexts
                    // widget.animatedListKey.currentState!.removeItem(widget.num, (context, animation) {
                    //   return Text('test');
                    // },);
                    // Timer(const Duration(milliseconds: 220), (){
                    //     _scrollController.animateTo(
                    //     _scrollController.position.minScrollExtent,
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.easeInOut
                    //   );
                    // });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
          ],
        ),
        if (selected)
          SlideInUp(
            from: 30,
            duration: const Duration(milliseconds: 500),
            child: EmojiSelector(
              emojiReaction1: () {
                selected = false;
                widget.reacted = true;
                widget.emojiIndex = 0;
                setState(() {
                  
                });
              }, 
              emojiReaction2: () { 
                selected = false;
                widget.reacted = true;
                widget.emojiIndex = 1;
                setState(() {
                  
                });
               }, 
              emojiReaction3: () { 
                selected = false;
                widget.reacted = true;
                widget.emojiIndex = 2;
                setState(() {
                  
                });
              }, 
              emojiRemove: () {  
                selected = false;
                widget.reacted = false;
                setState(() {
                  
                });
              },
            ),
          ),
      ],
    );
  }
}
