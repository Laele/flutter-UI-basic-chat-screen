import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations/presentation/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _offset = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
  final ScrollController _scrollController = ScrollController();
  List<Widget> _noteTexts = [];

  final _textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback(( _ ) {
        _noteTexts.insert(0, NoteText(num: _noteTexts.length));
        _animatedListKey.currentState!.insertItem(_noteTexts.length - 1);

    },);*/

    _scrollController.addListener((){
       print(_scrollController.position.pixels);
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 30,),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
        title: const Text('Usuario Desconocido'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              print('Tap');
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: [
                Expanded(
                  child: AnimatedList(
                    reverse: true,
                    clipBehavior: Clip.hardEdge,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    key: _animatedListKey,
                    initialItemCount: _noteTexts.length,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(_offset),
                        child: _noteTexts[index]
                      );
                    },
                  ),
                ),
                  Row(
                    children: [
                      Expanded(
                        child: ChatTextField(textEditingController: _textEditingController,) 
                      ),
            
                      const SizedBox(width: 10,),
            
                      FilledButton(
                        onPressed: (){
            
                          if(_textEditingController.text.isNotEmpty){
                            _noteTexts.insert(0, NoteText(text: _textEditingController.text, num: _noteTexts.length, animatedListKey: _animatedListKey, noteTexts: _noteTexts,));
                            _animatedListKey.currentState!.insertItem(0, duration: const Duration(milliseconds: 200 ));
                            
                            Timer(const Duration(milliseconds: 220), (){
                              _scrollController.animateTo(
                                _scrollController.position.minScrollExtent,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut
                              );
                            });
                            _textEditingController.clear();
                          }
                        }, 
                        style: ButtonStyle(shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)))),
                        child: const Icon(Icons.send, size: 15,),
                      )
                    ],
                  ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const ChatTextField({
    super.key, 
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLines: 3,
      minLines: 1,
    );
  }
}
