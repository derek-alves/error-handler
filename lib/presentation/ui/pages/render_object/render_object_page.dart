import 'dart:math';

import 'package:flutter/material.dart';

class RenderObjectPage extends StatefulWidget {
  const RenderObjectPage({super.key});

  @override
  State<RenderObjectPage> createState() => _RenderObjectPageState();
}

class _RenderObjectPageState extends State<RenderObjectPage> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = "Hellow,word";
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Render Object '),
      ),
      body: Center(
        child: SizedBox(
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(15),
                  child: ListenableBuilder(
                    listenable: _controller,
                    builder: (context, widget) => TimestampedChatMessage(
                      text: _controller.text,
                      sentAt: "2 minutes agor",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: TextField(controller: _controller),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimestampedChatMessage extends LeafRenderObjectWidget {
  final String text;
  final String sentAt;
  final TextStyle style;
  const TimestampedChatMessage({
    super.key,
    required this.text,
    required this.sentAt,
    required this.style,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return TimestampedChatMessageRenderObject(
      text: text,
      sentAt: sentAt,
      style: style,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant TimestampedChatMessageRenderObject renderObject) {
    renderObject.text = text;
    renderObject.sentAt = sentAt;
    renderObject.style = style;
    renderObject.textDirection = Directionality.of(context);
    super.updateRenderObject(context, renderObject);
  }
}

class TimestampedChatMessageRenderObject extends RenderBox {
  TimestampedChatMessageRenderObject({
    required String sentAt,
    required String text,
    required TextStyle style,
    required TextDirection textDirection,
  }) {
    _text = text;
    _sentAt = sentAt;
    _style = style;

    _textDirection = textDirection;
    _textPainter = TextPainter(
      text: textTextSpan,
      textDirection: _textDirection,
    );
    _sentAtTextPainter = TextPainter(
      text: sentAtTextSpan,
      textDirection: _textDirection,
    );
  }

  late TextDirection _textDirection;
  late String _text;
  late String _sentAt;
  late TextPainter _textPainter;
  late TextPainter _sentAtTextPainter;
  late TextStyle _style;
  late bool _sentAtFitsOnLastLine;
  late double _lineHeight;
  late double _lastMessageLineWidth;
  double _longestLineWidth = 0;
  late double _sentAtLineWidth;
  late int _numMessageLines;

  @override
  void performLayout() {
    _textPainter.layout(maxWidth: constraints.maxWidth);
    final textLines = _textPainter.computeLineMetrics();

    _sentAtTextPainter.layout(maxWidth: constraints.maxWidth);
    _sentAtLineWidth = _sentAtTextPainter.computeLineMetrics().first.width;

    for (final line in textLines) {
      _longestLineWidth = max(_longestLineWidth, line.width);
    }
    final sizeOfMessage = Size(_longestLineWidth, _textPainter.height);
    _lastMessageLineWidth = textLines.last.width;
    _lineHeight = textLines.last.height;
    _numMessageLines = textLines.length;

    final lastLineWithDate = _lastMessageLineWidth + (_sentAtLineWidth * 1.08);
    if (textLines.length == 1) {
      _sentAtFitsOnLastLine = lastLineWithDate < constraints.maxWidth;
    } else {
      _sentAtFitsOnLastLine =
          lastLineWithDate < min(_longestLineWidth, constraints.maxWidth);
    }

    late Size computedSize;

    if (!_sentAtFitsOnLastLine) {
      computedSize = Size(
        sizeOfMessage.width,
        sizeOfMessage.height + _sentAtTextPainter.height,
      );
    } else {
      if (textLines.length == 1) {
        computedSize = Size(
          lastLineWithDate,
          sizeOfMessage.height,
        );
      } else {
        computedSize = Size(
          _longestLineWidth,
          sizeOfMessage.height,
        );
      }
    }

    size = constraints.constrain(computedSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _textPainter.paint(context.canvas, offset);

    late Offset sentAtOffset;
    if (_sentAtFitsOnLastLine) {
      sentAtOffset = Offset(
        offset.dx + (size.width - _sentAtLineWidth),
        offset.dy + (_lineHeight * (_numMessageLines - 1)),
      );
    } else {
      sentAtOffset = Offset(
        offset.dx + (size.width - _sentAtLineWidth),
        offset.dy + _lineHeight * _numMessageLines,
      );
    }
    _sentAtTextPainter.paint(context.canvas, sentAtOffset);
    super.paint(context, offset);
  }

  String get text => _text;
  set text(String val) {
    if (val == _text) return;
    _text = val;
    _textPainter.text = textTextSpan;
    markNeedsLayout();
  }

  String get sentAt => _sentAt;
  set sentAt(String val) {
    if (val == _text) return;
    _sentAt = val;
    _sentAtTextPainter.text = sentAtTextSpan;
    markNeedsLayout();
  }

  TextStyle get style => _style;
  set style(TextStyle val) {
    if (val == _style) return;
    _style = val;
    _sentAtTextPainter.text = sentAtTextSpan;
    _textPainter.text = textTextSpan;
    markNeedsLayout();
  }

  TextDirection get textDirection => _textDirection;
  set textDirection(TextDirection val) {
    if (val == _textDirection) return;
    _textDirection = val;
    _sentAtTextPainter.textDirection = _textDirection;
    _textPainter.textDirection = _textDirection;
    markNeedsLayout();
  }

  TextSpan get textTextSpan => TextSpan(text: _text, style: _style);
  TextSpan get sentAtTextSpan => TextSpan(
        text: _sentAt,
        style: _style.copyWith(
          color: Colors.black,
        ),
      );
}
