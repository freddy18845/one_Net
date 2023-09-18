import 'package:flutter/material.dart';
import 'package:one_net/view_models/debug_switch_view_model.dart';
import 'package:provider/provider.dart';

class DebugSwitch extends StatelessWidget {
  const DebugSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DebugSwitchViewModel>(
      builder: (context, debugVM, child) {
        return Switch(
            // This bool value toggles the switch.
            value: debugVM.debug,
            activeColor: Colors.black,
            onChanged: (value) => debugVM.toggleDebug(value));
      },
    );
  }
}
