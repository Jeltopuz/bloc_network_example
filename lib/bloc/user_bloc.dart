import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:bloc_network_example/models/user.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc({
    @required this.usersRepository,
  }) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      await loading(emit);
    });
    on<UserClearEvent>((event, emit) => emit(UserEmptyState()));
  }

  Future<void> loading(Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final List<User> _loadedUserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(
        loadedUser: _loadedUserList,
      ));
    } catch (_) {
      emit(UserErrorState());
    }
  }
}
