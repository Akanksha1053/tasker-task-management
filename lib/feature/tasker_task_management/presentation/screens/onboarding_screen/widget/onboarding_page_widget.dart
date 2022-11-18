import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/page_view_bloc/page_view_bloc.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    Key? key,
    required this.controller,
    required this.pages,
  }) : super(key: key);

  final PageController controller;
  final List<Column> pages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      padding: const EdgeInsets.all(30),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PageView.builder(
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (_, index) {
            BlocProvider.of<PageViewBloc>(context)
                .add(PageViewIndexEvent(index));

            return pages[index % pages.length];
          },
        ),
      ),
    );
  }
}
