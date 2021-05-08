part of 'bird_count_bloc.dart';

@immutable
abstract class BirdCountEvent {}

class IncreaseBrown extends BirdCountEvent {}

class IncreaseGrey extends BirdCountEvent {}

class IncreaseBlack extends BirdCountEvent {}

class IncreaseOrange extends BirdCountEvent {}

class ResetCounter extends BirdCountEvent {}
