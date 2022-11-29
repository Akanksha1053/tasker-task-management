import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/get_all_members/get_all_members_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/error_dialog.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/dashboard_search_widget.dart';

class GetAllMemberScreen extends StatefulWidget {
  const GetAllMemberScreen({super.key});

  @override
  State<GetAllMemberScreen> createState() => _GetAllMemberScreenState();
}

class _GetAllMemberScreenState extends State<GetAllMemberScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.appbarBackgroundColor,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            TextConstants.addMemberText,
            style: TextStyleConstants.appbarTitleTextStyle,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<GetAllMembersBloc, GetAllMembersState>(
              builder: (context, state) {
                if (state is InitialState) {
                  BlocProvider.of<GetAllMembersBloc>(context)
                      .add(FetchAllMemberEvent());
                }
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is SuccessState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        DashboardSearchWidget(
                          controller: searchController,
                          label: 'Search',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              TextConstants.selectedText,
                              style: TextStyleConstants.headlineTextStyle,
                            ),
                            Text(
                              '(${state.selectedMemberList.length.toString()})',
                              style: TextStyleConstants.headlineTextStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: state.allMembers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Material(
                                        elevation: 1,
                                        color: ColorConstants
                                            .scaffoldBackgroundColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r)),
                                        shadowColor: ColorConstants.lightGrey,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                              radius: 24.r,
                                              backgroundImage: NetworkImage(
                                                state.allMembers[index].picture,
                                              )),
                                          title: Text(
                                            '${(state.allMembers[index].firstName)}'
                                            ' ${(state.allMembers[index].lastName)}',
                                            style: TextStyleConstants
                                                .onboardingTextStyle,
                                          ),
                                          subtitle: Text(
                                            'UI/Ux designer',
                                            style: TextStyleConstants
                                                .alreadyHaveAnAccountTextStyle,
                                          ),
                                          onTap: (() {
                                            setState(() {
                                              BlocProvider.of<
                                                          GetAllMembersBloc>(
                                                      context)
                                                  .add(SelectMemberEvent(
                                                      personSelected: state
                                                          .allMembers[index]));
                                            });
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }
                if (state is FailureState) {
                  showDialogForErrror(
                      message: state.errorMessage,
                      context: context,
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      });
                }
                return Container();
              },
            )));
  }
}
