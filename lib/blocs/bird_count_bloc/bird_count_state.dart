part of 'bird_count_bloc.dart';

@immutable
abstract class BirdCountState {
  BirdCountState({
    @required this.count,
    @required this.color,
  });

  final count;
  final color;
}

class BirdCountInitial extends BirdCountState {
  BirdCountInitial()
      : super(
          count: 0,
          color: Colors.blue,
        );
}

class BirdCountIncreased extends BirdCountState {
  BirdCountIncreased({
    count,
    color,
  }) : super(
          count: count,
          color: color,
        );
}
