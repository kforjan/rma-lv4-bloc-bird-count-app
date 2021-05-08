part of 'bird_count_bloc.dart';

@immutable
abstract class BirdCountState {}

class BirdCountInitial extends BirdCountState {
  final count = 0;
  final color = Colors.blue;
}

class BirdCountIncreased extends BirdCountState {
  BirdCountIncreased({
    @required this.count,
    @required this.color,
  });

  final int count;
  final Color color;
}
