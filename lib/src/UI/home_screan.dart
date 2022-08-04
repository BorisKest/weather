import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double thickness = 2.0;
  Color dividerColor = Colors.blueGrey;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WeatherBloc _bloc = BlocProvider.of<WeatherBloc>(context);
    return BlocProvider<WeatherBloc>(
      create: ((context) => WeatherBloc()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
                controller: _controller,
              ),
              Divider(
                color: dividerColor,
                thickness: thickness,
              ),
              ElevatedButton(
                onPressed: (() {
                  _bloc.add(WeatherFetchEvent(_controller.text));
                  Navigator.of(context).pushNamed('/weatherScreen');
                }),
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
