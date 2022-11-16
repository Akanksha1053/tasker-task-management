import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_management/core/constants/navigation_constants.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(const BottomNavigationInitial(NavbarItem.home, 0)) {
    on<SelectBottomNavigationEvent>((event, emit) {
      switch (event.navbarItem) {
        case NavbarItem.home:
          emit(const BottomNavigationLoaded(NavbarItem.home, 0));
          break;
        case NavbarItem.chat:
          emit(const BottomNavigationLoaded(NavbarItem.chat, 1));
          break;
        case NavbarItem.notification:
          emit(const BottomNavigationLoaded(NavbarItem.notification, 2));
          break;
        case NavbarItem.settings:
          emit(const BottomNavigationLoaded(NavbarItem.settings, 3));
          break;
      }
    });
  }
}
