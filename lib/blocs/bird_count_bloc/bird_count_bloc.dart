import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bird_count_event.dart';
part 'bird_count_state.dart';

class BirdCountBloc extends Bloc<BirdCountEvent, BirdCountState> {
  BirdCountBloc() : super(BirdCountInitial());

  @override
  Stream<BirdCountState> mapEventToState(
    BirdCountEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
