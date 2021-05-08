import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rma_lv4_bird_counting_bloc/data/sharedpref/shared_preferences_helper.dart';

part 'bird_count_event.dart';
part 'bird_count_state.dart';

class BirdCountBloc extends Bloc<BirdCountEvent, BirdCountState> {
  BirdCountBloc(this.spHelper) : super(BirdCountInitial()) {
    this.add(LoadStoredCountData());
  }

  SharedPreferencesHelper spHelper;

  @override
  Stream<BirdCountState> mapEventToState(
    BirdCountEvent event,
  ) async* {
    if (event is LoadStoredCountData) {
      final data = await spHelper.getStoredBirdData();
      if (data['count'] != null && data['color'] != null) {
        yield BirdCountIncreased(count: data['count'], color: data['color']);
      } else {
        yield BirdCountInitial();
      }
    } else if (event is ResetCounter) {
      yield BirdCountInitial();
      spHelper.deleteAllData();
    } else if (event is IncreaseBrown) {
      spHelper.saveBirdCount(state.count + 1);
      spHelper.saveLastBirdColor('brown');
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.brown,
      );
    } else if (event is IncreaseGrey) {
      spHelper.saveBirdCount(state.count + 1);
      spHelper.saveLastBirdColor('grey');
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.grey,
      );
    } else if (event is IncreaseBlack) {
      spHelper.saveBirdCount(state.count + 1);
      spHelper.saveLastBirdColor('black');
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.black,
      );
    } else if (event is IncreaseOrange) {
      spHelper.saveBirdCount(state.count + 1);
      spHelper.saveLastBirdColor('orange');
      yield BirdCountIncreased(
        count: state.count + 1,
        color: Colors.orange,
      );
    }
  }
}
