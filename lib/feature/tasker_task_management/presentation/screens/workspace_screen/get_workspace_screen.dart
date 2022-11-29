import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/workspace_bloc/workspace_bloc.dart';

class GetWorkspaceScreen extends StatelessWidget {
  const GetWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            TextConstants.workspaceTitleText,
            style: TextStyleConstants.appbarTitleTextStyle,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorConstants.appbarBackgroundColor,
        ),
        body: BlocBuilder<WorkspaceBloc, WorkspaceState>(
            builder: (context, state) {
          if (state is InitialState) {
            BlocProvider.of<WorkspaceBloc>(context)
                .add(FetchAllWorkspaceEvent());
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetWorkspaceSuccessState) {
            return StreamBuilder(
                stream: state.allWorkspaces,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No workspaces available'),
                    );
                  } else if (snapshot.hasData) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .push(const ChoosePlanScreenRoute());
                                },
                                child: ListTile(
                                  leading: Text(
                                    snapshot.data![index].name,
                                    style:
                                        TextStyleConstants.workspaceTextStyle,
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Container();
                  }
                }));
          }
          return Container();
        }));
  }
}
