import 'package:signals/signals.dart';

List<String> feedbackTypes = <String>['bug', 'enhancement', 'other'];

class FeedBackStore {
  final Signal<List<String>> mainScreenLabels = Signal<List<String>>(
    const ['mainscreen', 'timer'],
    options: const SignalOptions(name: ' MAIN SCREEN LABELS '),
  );

  void updatePage(int pageIndex) {
    if (pageIndex == 0) {
      mainScreenLabels.value = const ['mainscreen', 'timer'];
    } else {
      mainScreenLabels.value = const ['mainscreen', 'history'];
    }
  }
}
