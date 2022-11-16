part of 'page_view_bloc.dart';

@immutable
abstract class PageViewState {}

class PageViewInitial extends PageViewState {
  final int index;
  PageViewInitial(this.index);
  List<Object> get props => [index];
}
