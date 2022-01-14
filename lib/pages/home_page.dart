import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/widgets/action_buttons.dart';
import 'package:bloc_network_example/widgets/search.dart';
import 'package:bloc_network_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersRepository = UsersRepository();

    return BlocProvider<UserBloc>(
      create: (context) =>
          UserBloc(usersRepository: usersRepository)..add(UserLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('usersList'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ActionButtons(),
            Search(),
            Expanded(
              child: UserList(),
            )
          ],
        ),
      ),
    );
  }
}
