import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';

class ShiftHistoryTile extends StatefulWidget {
  const ShiftHistoryTile({
    super.key,
  });

  @override
  State<ShiftHistoryTile> createState() => _ShiftHistoryTileState();
}

class _ShiftHistoryTileState extends State<ShiftHistoryTile> {
  bool isPositionTaken = false;

  @override
  Widget build(BuildContext context) {
    final ui = UiUtil(context);
    return Card(
      color: Colors.white,
      elevation: ui.scaleWidthFactor(8),
      shadowColor: ui.theme.colorScheme.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: ui.scaleWidthFactor(30),
              backgroundColor: ui.theme.colorScheme.primary.withOpacity(0.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '6',
                    style: ui.theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Jan',
                    style: ui.theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6hrs clocked in',
                    textScaler: TextScaler.linear(ui.textScaleFactor),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ui.scaleWidthFactor(10),
                      vertical: ui.scaleWidthFactor(2),
                    ),
                    decoration: BoxDecoration(
                      color: isPositionTaken
                          ? const Color(0xFFFF3B30)
                          : const Color(0xFF34C759),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      isPositionTaken ? 'Reserved' : 'Available',
                      style: ui.theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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
