import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_view_event.dart';
part 'page_view_state.dart';

class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
  PageViewBloc() : super(PageViewInitial(0)) {
    on<PageViewIndexEvent>((event, emit) {
      emit(PageViewInitial(event.index));
    });
  }
}
