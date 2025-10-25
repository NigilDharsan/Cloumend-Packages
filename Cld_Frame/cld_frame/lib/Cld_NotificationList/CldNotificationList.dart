import 'package:flutter/material.dart';

class CldNotificationCard extends StatelessWidget {
  final Widget? leading;
  final Widget actionIcon;
  final String? title;
  final String? content;
  final String? date;
  final String? time;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? verticalMargin;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final TextStyle? dateTimeStyle;
  final Color? cardColor;
  final double? elevation;
  final bool isActionIconTitle;
  final bool isActionIconSubTitle;
  final double? leadingGap;

  const CldNotificationCard(
      {super.key,
      this.leading,
      required this.actionIcon,
      this.title,
      required this.content,
      this.date,
      this.time,
      this.horizontalPadding = 4,
      this.verticalPadding = 4,
      this.titleStyle = const TextStyle(fontWeight: FontWeight.bold),
      this.contentStyle,
      this.dateTimeStyle = const TextStyle(color: Colors.grey, fontSize: 12),
      this.cardColor,
      this.elevation,
      this.isActionIconTitle = false,
      this.isActionIconSubTitle = false,
      this.leadingGap,
      this.verticalMargin});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: cardColor,
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 4),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 4,
          vertical: verticalPadding ?? 4,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leading != null) ...[
              leading!,
              SizedBox(width: leadingGap ?? 8),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title?.isNotEmpty == true)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title??'',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: titleStyle,
                          ),
                        ),
                        if (isActionIconTitle) ...[
                          const SizedBox(width: 8),
                          actionIcon,
                        ],
                      ],
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          content ?? '',
                          style: contentStyle,
                        ),
                      ),
                      if (isActionIconSubTitle) ...[
                        const SizedBox(width: 8),
                        actionIcon,
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${date ?? ''} ${time ?? ''}',
                    style: dateTimeStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}