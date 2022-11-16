part of 'page_view_bloc.dart';

@immutable
abstract class PageViewEvent {}

class PageViewIndexEvent extends PageViewEvent {
  final int index;
  PageViewIndexEvent(this.index);
  List<Object> get props => [index];
}
