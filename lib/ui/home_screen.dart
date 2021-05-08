import 'package:flutter/material.dart';
import 'package:rma_lv4_bird_counting_bloc/data/sharedpref/shared_preferences_helper.dart';
import 'package:rma_lv4_bird_counting_bloc/injection_container.dart' as di;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count;
  Color color;

  @override
  void initState() {
    super.initState();
    _getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bird Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: count == null
                    ? Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white)),
                      )
                    : Center(
                        child: Text(
                          count.toString(),
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIncrementButton('Brown', Colors.brown),
              _buildIncrementButton('Grey', Colors.grey),
              _buildIncrementButton('Black', Colors.black),
              _buildIncrementButton('Orange', Colors.orange),
            ],
          ),
          ElevatedButton(
            onPressed: _onResetButtonTap,
            child: Text('Reset'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncrementButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        _onIncrementButtonTap(text);
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }

  void _onIncrementButtonTap(String color) {
    switch (color) {
      case 'Brown':
        setState(() {
          this.color = Colors.brown;
          count++;
        });
        di.locator<SharedPreferencesHelper>().saveLastBirdColor('brown');
        break;
      case 'Grey':
        setState(() {
          this.color = Colors.grey;
          count++;
        });
        di.locator<SharedPreferencesHelper>().saveLastBirdColor('grey');
        break;
      case 'Black':
        setState(() {
          this.color = Colors.black;
          count++;
        });
        di.locator<SharedPreferencesHelper>().saveLastBirdColor('black');
        break;
      case 'Orange':
        setState(() {
          this.color = Colors.orange;
          count++;
        });
        di.locator<SharedPreferencesHelper>().saveLastBirdColor('orange');
        break;
      default:
        setState(() {
          this.color = Colors.blue;
        });
    }
    di.locator<SharedPreferencesHelper>().saveBirdCount(this.count);
  }

  void _onResetButtonTap() {
    setState(() {
      this.color = Colors.blue;
      this.count = 0;
    });
    di.locator<SharedPreferencesHelper>().deleteAllData();
  }

  Future<Null> _getSharedPrefs() async {
    final data =
        await di.locator<SharedPreferencesHelper>().getStoredBirdData();
    setState(() {
      count = data['count'];
      color = data['color'];
    });
  }
}
