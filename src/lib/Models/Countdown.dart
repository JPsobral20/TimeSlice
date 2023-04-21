class Countdown {
  Duration duration;
  DateTime? _currentEndDate;

  Countdown({ required this.duration, bool isRunning = false }) {
    if (isRunning) {
      _currentEndDate = DateTime.now().add(duration);
    }
  }

  Countdown stop() {
    return Countdown(
        duration: timeLeft,
        isRunning: false
    );
  }

  Countdown resume() {
    return Countdown(
        duration: timeLeft,
        isRunning: false
    );
  }

  Duration get timeLeft {
    final endDate = _currentEndDate;
    if (endDate == null) return duration;

    Duration timeLeft = endDate.difference(DateTime.now());
    return timeLeft;
  }
}