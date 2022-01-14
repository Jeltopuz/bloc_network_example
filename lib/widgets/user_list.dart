import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Center(
          child: Text(
            'No data received\nPress Butoon Load',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }

      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) {
            final user = state.loadedUser[index];
            return Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID: ${user.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Email: ${user.email}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone:  ${user.phone}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }

      if (state is UserErrorState) {
        return const Center(
          child: Text(
            'Error fetching users',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return Container();
    });
  }
}
