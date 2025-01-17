import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class FlyerChatTextMessage extends StatelessWidget {
  final TextMessage message;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const FlyerChatTextMessage({
    super.key,
    required this.message,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    final textMessageTheme =
        context.select((ChatTheme theme) => theme.textMessageTheme);
    final isSentByMe = context.watch<User>().id == message.author.id;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: isSentByMe
            ? textMessageTheme.sentBackgroundColor
            : textMessageTheme.receivedBackgroundColor,
        borderRadius: borderRadius,
      ),
      child: MarkdownBody(
        data: message.text,
        styleSheet: MarkdownStyleSheet(
          p: isSentByMe
              ? textMessageTheme.sentTextStyle
              : textMessageTheme.receivedTextStyle,
        ),
      ),
    );
  }
}
