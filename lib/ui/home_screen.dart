import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rma_lv4_bird_counting_bloc/blocs/bird_count_bloc/bird_count_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   BlocProvider.of<BirdCountBloc>(context).add(LoadStoredCountData());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bird Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocConsumer<BirdCountBloc, BirdCountState>(
            listener: (context, state) {},
            builder: (context, state) => _buildBirdCountDisplay(state),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIncrementButton(context, 'Brown', Colors.brown),
              _buildIncrementButton(context, 'Grey', Colors.grey),
              _buildIncrementButton(context, 'Black', Colors.black),
              _buildIncrementButton(context, 'Orange', Colors.orange),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _onResetButtonTap(context);
            },
            child: Text('Reset'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncrementButton(BuildContext context, String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        _onIncrementButtonTap(context, text);
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }

  Widget _buildBirdCountDisplay(BirdCountState state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: state.color,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              state.count.toString(),
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _onIncrementButtonTap(BuildContext context, String color) {
    final birdCountBloc = BlocProvider.of<BirdCountBloc>(context);
    switch (color) {
      case 'Brown':
        birdCountBloc.add(IncreaseBrown());
        break;
      case 'Grey':
        birdCountBloc.add(IncreaseGrey());
        break;
      case 'Black':
        birdCountBloc.add(IncreaseBlack());
        break;
      case 'Orange':
        birdCountBloc.add(IncreaseOrange());
        break;
      default:
        break;
    }
  }

  void _onResetButtonTap(BuildContext context) {
    final birdCountBloc = BlocProvider.of<BirdCountBloc>(context);

    birdCountBloc.add(ResetCounter());
  }
}
