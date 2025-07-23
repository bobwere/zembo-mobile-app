import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zembo_agent_app/core/utils/ui_util.dart';
import 'package:zembo_agent_app/domain/battery_request/battery_request.dart';

class BatteryRequestTile extends StatefulWidget {
  const BatteryRequestTile({
    required this.batteryRequest,
    super.key,
  });

  final BatteryRequest batteryRequest;

  @override
  State<BatteryRequestTile> createState() => _BatteryRequestTileState();
}

class _BatteryRequestTileState extends State<BatteryRequestTile> {
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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.batteryRequest.numberOfBatteries} Batteries Requested',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(10)),
                      Text(
                        'Requested on ${Jiffy.parseFromDateTime(DateTime.parse(widget.batteryRequest.createdAt!)).format(pattern: 'do MMM yyyy h:mm a')}\n${widget.batteryRequest.synced == false ? '(Not Synced)' : '(Synced)'}',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ui.scaleWidthFactor(10),
                    vertical: ui.scaleWidthFactor(2),
                  ),
                  decoration: BoxDecoration(
                    color: widget.batteryRequest.status == 'requested'
                        ? const Color(0xFFFF3B30)
                        : widget.batteryRequest.status == 'assigned'
                        ? const Color.fromARGB(255, 199, 128, 52)
                        : widget.batteryRequest.status == 'picked up'
                        ? const Color.fromARGB(255, 52, 113, 199)
                        : const Color(0xFF34C759),

                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    widget.batteryRequest.status == 'requested'
                        ? 'Requested'
                        : widget.batteryRequest.status == 'assigned'
                        ? 'Rider Assigned'
                        : widget.batteryRequest.status == 'picked up'
                        ? 'Picked Up'
                        : 'Delivered',
                    style: ui.theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ui.scaleHeightFactor(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ui.scaleWidthFactor(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.5),
                        ),
                        child: Icon(
                          LineAwesomeIcons.user_circle,
                          color: Colors.white,
                          size: ui.scaleWidthFactor(25),
                        ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(10)),
                      Text(
                        'Swapper',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(5)),
                      Text(
                        'Me',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ui.scaleWidthFactor(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.5),
                        ),
                        child: Icon(
                          LineAwesomeIcons.briefcase_solid,
                          color: Colors.white,
                          size: ui.scaleWidthFactor(25),
                        ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(10)),
                      Text(
                        'Dispatch Officer',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(5)),
                      Text(
                        widget.batteryRequest.dispatchOfficer?.username ??
                            'N/A',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ui.scaleWidthFactor(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.5),
                        ),
                        child: Icon(
                          LineAwesomeIcons.biking_solid,
                          color: Colors.white,
                          size: ui.scaleWidthFactor(25),
                        ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(10)),
                      Text(
                        'Rider',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                      ),
                      SizedBox(height: ui.scaleHeightFactor(5)),
                      Text(
                        widget.batteryRequest.rider?.username ?? 'N/A',
                        textScaler: TextScaler.linear(ui.textScaleFactor),
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
