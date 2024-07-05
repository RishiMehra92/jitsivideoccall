import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:jitsivideoccall/Meeting.dart';
import 'package:jitsivideoccall/NotebookPaper.dart';

import 'SearchScreen.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Meeting()),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(16.0),
              child: const NotebookPaper(
                entireText: [
                  'Hello, Notebook Paper!',
                  'This is line 1',
                  'This is line 2',
                  'This is line 3',
                  'This is line 4',
                ],
                title: 'My Notebook',
                fontSize: 20.0,
                rowHeight: 1.0,
                width: 0.8,
                paperColor: Color.fromARGB(255, 253, 248, 184),
                horizontalLinesColor: Colors.blue,
                verticalLinesColor: Colors.pink,
                pageTitle: true,
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: SearchScreen(),
          ),
        ],
      ),
    );
  }

}
