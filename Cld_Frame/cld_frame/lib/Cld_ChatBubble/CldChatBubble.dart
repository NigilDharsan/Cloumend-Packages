import 'package:flutter/material.dart';

enum BubbleType { simple, special }

class CldChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;
  final Color? bubbleColor;
  final bool? sent;
  final bool? delivered;
  final bool? seen;
  final BubbleType? bubbleType;
  final EdgeInsets? padding;
  final Color? sentIconColor;
  final Color? deliveredIconColor;
  final Color? seenIconColor;
  final double? iconSize;
  final TextStyle? timeTextStyle;
  final double? bubbleTimeGap;
  final TextStyle? senderMessageTextStyle;
  final TextStyle? othersMessageTextStyle;
  final Color? othersBubbleColor;
  final Color? senderBubbleColor;
  final Widget? avatar;

  const CldChatBubble(
      {super.key,
      required this.message,
      required this.time,
      required this.isSender,
      this.bubbleColor,
      this.sent,
      this.delivered,
      this.seen,
      this.bubbleType,
      this.padding,
      this.deliveredIconColor,
      this.seenIconColor,
      this.sentIconColor,
      this.iconSize,
      this.timeTextStyle,
      this.bubbleTimeGap,
      this.senderMessageTextStyle,
      this.othersMessageTextStyle,
      this.othersBubbleColor,
      this.senderBubbleColor,
      this.avatar});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16);
    final BorderRadius borderRadius = bubbleType == BubbleType.simple
        ? const BorderRadius.all(radius)
        : BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: isSender ? radius : const Radius.circular(0),
            bottomRight: isSender ? const Radius.circular(0) : radius,
          );

    final bgColor = isSender
        ? (senderBubbleColor ?? Color(0xFF042479))
        : (othersBubbleColor ?? Color(0xFF505764));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender && avatar != null) avatar!,
          if (!isSender && avatar != null) const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: padding ??
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: borderRadius,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                    ),
                    child: Text(
                      message,
                      style: isSender
                          ? senderMessageTextStyle
                          : othersMessageTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: bubbleTimeGap ?? 4),
                Row(
                  mainAxisAlignment: isSender
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: timeTextStyle ??
                          const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    if (isSender)
                      sent == true
                          ? Icon(
                              Icons.done,
                              color: sentIconColor,
                              size: iconSize ?? 18,
                            )
                          : delivered == true
                              ? Icon(
                                  Icons.done_all,
                                  color: deliveredIconColor,
                                  size: iconSize ?? 18,
                                )
                              : seen == true
                                  ? Icon(
                                      Icons.done_all,
                                      color: seenIconColor,
                                      size: iconSize ?? 18,
                                    )
                                  : const SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
          if (isSender && avatar != null) const SizedBox(width: 8),
          if (isSender && avatar != null) avatar!
        ],
      ),
    );
  }
}
