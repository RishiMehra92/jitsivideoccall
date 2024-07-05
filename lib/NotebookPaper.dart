import 'package:flutter/material.dart';

class NotebookPaper extends StatelessWidget {
  final String title;
  final double fontSize;
  final double rowHeight;
  final double width;
  final Color paperColor;
  final Color horizontalLinesColor;
  final Color verticalLinesColor;
  final bool pageTitle;
  final List<String> entireText;

  const NotebookPaper({
    Key? key,
    required this.entireText,
    required this.title,
    required this.fontSize,
    required this.rowHeight,
    required this.width,
    required this.paperColor,
    required this.horizontalLinesColor,
    required this.verticalLinesColor,
    this.pageTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue
          ),
          child: const Center(child: Text('View Customer Info',style: TextStyle(color: Colors.white),)),
        ),
        Container(
          color: paperColor,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           //   if (pageTitle) Text(title, style: TextStyle(fontSize: fontSize * 1.5, fontWeight: FontWeight.bold)),
              for (var line in entireText)
                Container(
                  color: paperColor,
                  margin: EdgeInsets.symmetric(vertical: rowHeight / 2),
                  child: Text(
                    line,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
