import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            userBloc.add(
              UserLoadEvent(),
            );
          },
          child: const Text(
            'Load',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(
          onPressed: () {
            userBloc.add(
              UserClearEvent(),
            );
          },
          child: const Text(
            'Clear',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
