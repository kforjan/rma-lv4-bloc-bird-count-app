import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rma_lv4_bird_counting_bloc/data/sharedpref/shared_preferences_helper.dart';
import 'package:rma_lv4_bird_counting_bloc/injection_container.dart' as di;

part 'bird_count_event.dart';
part 'bird_count_state.dart';

class BirdCountBloc extends Bloc<BirdCountEvent, BirdCountState> {
  BirdCountBloc() : super(BirdCountInitial());

  @override
  Stream<BirdCountState> mapEventToState(
    BirdCountEvent event,
  ) async* {
    if (event is LoadStoredCountData) {
      final data =
          await di.locator<SharedPreferencesHelper>().getStoredBirdData();
      if (data['count'] != null && data['color'] != null) {
        yield BirdCountIncreased(count: data['count'], color: data['color']);
      } else {
        yield BirdCountInitial();
      }
    } else if (event is ResetCounter) {
      yield BirdCountInitial();
      di.locator<SharedPreferencesHelper>().deleteAllData();
    } else if (event is IncreaseBrown) {
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.brown,
      );
    } else if (event is IncreaseGrey) {
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.grey,
      );
    } else if (event is IncreaseBlack) {
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.black,
      );
    } else if (event is IncreaseOrange) {
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.orange,
      );
    }
  }
}
