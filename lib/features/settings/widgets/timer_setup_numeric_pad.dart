import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiseworkout/features/settings/widgets/timer_setup_key.dart';

class TimerSetUpNumericPad extends StatelessWidget {
  const TimerSetUpNumericPad({
    required this.onDigitTap,
    required this.onBackspaceTap,
    super.key,
  });

  final ValueChanged<String> onDigitTap;
  final VoidCallback onBackspaceTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        spacing: 20,
        children: [
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildRow([null, '0', 'backspace']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String?> keys) {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: keys.map((String? key) {
        if (key == null) return const SizedBox(width: 80);
        return TimerSetUpKey(
          label: key == 'backspace' ? null : key,
          icon: key == 'backspace' ? Icons.backspace_outlined : null,
          onTap: key == 'backspace'
              ? () async {
                  await HapticFeedback.mediumImpact();
                  onBackspaceTap();
                }
              : () async {
                  await HapticFeedback.lightImpact();
                  onDigitTap(key);
                },
        );
      }).toList(),
    );
  }
}
