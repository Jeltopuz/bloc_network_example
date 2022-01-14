import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:bloc_network_example/models/user.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  List<User> _loadedUserList;

  UserBloc({
    @required this.usersRepository,
  }) : super(UserLoadingState()) {
    on<UserLoadEvent>((event, emit) async {
      await loading(emit);
    });
    on<UserSearchEvent>((event, emit) async {
      await search(emit, event.searchString);
    });
    on<UserClearEvent>((event, emit) => emit(UserEmptyState()));
  }

  Future<void> loading(Emitter<UserState> emit) async {
    emit(UserLoadingState());
    //   await Future.delayed(const Duration(seconds: 5));
    try {
      _loadedUserList ??= await usersRepository.getAllUsers();
      emit(UserLoadedState(
        loadedUser: _loadedUserList,
      ));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> search(Emitter<UserState> emit, String search) async {
    List<User> _loadedUserFilteredList = _loadedUserList;
    if (_loadedUserList != null) {
      _loadedUserFilteredList = _loadedUserList
          .where((element) =>
              element.name.toUpperCase().contains(search.toUpperCase()))
          .toList();
      emit(UserLoadedState(
        loadedUser: _loadedUserFilteredList,
      ));
    }
  }
}
