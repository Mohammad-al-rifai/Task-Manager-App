import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../../core/utils/components/default_empty_widget.dart';
import '../../../core/utils/components/default_error_widget.dart';
import '../../../core/utils/components/loading.dart';
import '../../../core/utils/components/my_listview.dart';
import '../../../core/utils/components/my_text.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../domain/models/responses/todos/todos_model.dart';
import '../../cubits/remote_todos_cubit/remote_todos_cubit.dart';
import '../../widgets/todo_widget.dart';

class MyTasksView extends StatefulWidget {
  const MyTasksView({super.key});

  @override
  State<MyTasksView> createState() => _MyTasksViewState();
}

class _MyTasksViewState extends State<MyTasksView> {
  late RemoteTodosCubit cubit;

  @override
  void initState() {
    cubit = RemoteTodosCubit.get(context);
    cubit.getMyTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      title: MText(text: AppStrings.myTasks),
    );
  }

  Widget getBody() {
    return BlocConsumer<RemoteTodosCubit, RemoteTodosStates>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (RemoteTodosLoading):
            return const DefaultLoading();

          case const (RemoteTodosFailed):
            return const DefaultError();

          case const (RemoteTodosSuccess):
            return Conditional.single(
                context: context,
                conditionBuilder: (context) => state.todos.isNotEmpty,
                widgetBuilder: (context) {
                  return MyListView<Todo>(
                    fetchData: () => cubit.getMyTasks(),
                    list: state.todos,
                    noMoreData: true,
                    itemBuilder: (BuildContext context, Todo todo) {
                      return TodoWidget(todo: todo);
                    },
                  );
                },
                fallbackBuilder: (context) {
                  return const DefaultEmpty();
                });

          default:
            return const SizedBox();
        }
      },
    );
  }
}
