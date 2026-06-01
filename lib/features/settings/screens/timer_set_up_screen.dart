import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/features/settings/enums/enums.dart';
import 'package:wiseworkout/features/settings/widgets/timer_setup_clickable_unit.dart';
import 'package:wiseworkout/features/settings/widgets/timer_setup_numeric_pad.dart';
import 'package:wiseworkout/features/settings/widgets/timer_setup_validation_button.dart';

class TimerSetUpScreen extends StatefulWidget {
  const TimerSetUpScreen({required this.initialValue, required this.isFirst, super.key});
  final String initialValue;
  final bool isFirst;

  @override
  State<TimerSetUpScreen> createState() => _TimerSetUpScreenState();
}

class _TimerSetUpScreenState extends State<TimerSetUpScreen> {
  late String _min;
  late String _sec;
  TimerField _activeField = .minutes;

  @override
  void initState() {
    super.initState();
    // Parsing initial format: e.g. "01:30s" -> min: "01", sec: "30"
    final String clean = widget.initialValue.replaceAll('s', '');
    final List<String> parts = clean.split(':');
    if (parts.length >= 2) {
      _min = parts[parts.length - 2].padLeft(2, '0');
      _sec = parts[parts.length - 1].padLeft(2, '0');
    } else {
      _min = '00';
      _sec = parts[0].padLeft(2, '0');
    }
  }

  void _updateValue(String digit) {
    setState(() {
      if (_activeField == .minutes) {
        _min = (_min + digit).substring((_min + digit).length - 2);
      } else {
        _sec = (_sec + digit).substring((_sec + digit).length - 2);
      }
    });
  }

  void _backspace() {
    setState(() {
      if (_activeField == .minutes) {
        _min = '0${_min.substring(0, 1)}';
      } else {
        _sec = '0${_sec.substring(0, 1)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          const Spacer(),
          // Segmented display
          Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .baseline,
            textBaseline: .alphabetic,
            children: [
              TimerSetUpClickableUnit(
                value: _min,
                field: .minutes,
                activeField: _activeField,
                onTap: () => setState(() => _activeField = .minutes),
              ),
              Text(':', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 60)),
              TimerSetUpClickableUnit(
                value: _sec,
                field: .seconds,
                activeField: _activeField,
                onTap: () => setState(() => _activeField = .seconds),
              ),
              Text(
                's',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 30,
                  fontWeight: _activeField == .seconds ? .w500 : .w300,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            (context.localizations.localeName == 'fr'
                    ? "MODIFIER LES ${_activeField == TimerField.minutes ? 'MINUTES' : 'SECONDES'}"
                    : "EDIT ${_activeField == TimerField.minutes ? 'MINUTES' : 'SECONDS'}")
                .toUpperCase(),
            style: TextStyle(color: Theme.of(context).colorScheme.primary, letterSpacing: 1.5, fontSize: 12),
          ),
          const Spacer(),
          TimerSetUpNumericPad(
            onDigitTap: _updateValue,
            onBackspaceTap: _backspace,
          ),
          const Spacer(),
          TimerSetUpValidationButton(
            onPressed: () {
              final int s = int.parse(_sec);
              if (s > 59) {
                if (kDebugMode) {
                  print('Le nombre de secondes doit être inférieur à 60.');
                }
                _sec = '00';
              }

              setState(() {});
              final int totalSeconds = (int.parse(_min) * 60) + int.parse(_sec);
              Navigator.of(context).pop(totalSeconds);
            },
          ),
        ],
      ),
    );
  }
}
