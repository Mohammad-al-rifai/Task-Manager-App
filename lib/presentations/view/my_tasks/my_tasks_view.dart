import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../../core/utils/components/default_empty_widget.dart';
import '../../../core/utils/components/default_error_widget.dart';
import '../../../core/utils/components/loading.dart';
import '../../../core/utils/components/my_listview.dart';
import '../../../core/utils/components/my_text.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../domain/models/todos/todos_model.dart';
import '../../cubits/todo_cubit/to_do_cubit.dart';
import '../../widgets/todo_widget.dart';

class MyTasksView extends StatefulWidget {
  const MyTasksView({super.key});

  @override
  State<MyTasksView> createState() => _MyTasksViewState();
}

class _MyTasksViewState extends State<MyTasksView> {
  late ToDoCubit cubit;

  @override
  void initState() {
    cubit = ToDoCubit.get(context);
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
    return BlocConsumer<ToDoCubit, ToDoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetMyTasksLoadingState) {
          return const DefaultLoading();
        }
        if (state is GetMyTasksErrorState) {
          return const DefaultError();
        }
        return Conditional.single(
            context: context,
            conditionBuilder: (context) => cubit.myTasks.isNotEmpty,
            widgetBuilder: (context) {
              return MyListView<Todo>(
                fetchData: () => cubit.getMyTasks(),
                list: cubit.myTasks,
                noMoreData: true,
                itemBuilder: (BuildContext context, Todo todo) {
                  return TodoWidget(todo: todo);
                },
              );
            },
            fallbackBuilder: (context) {
              return const DefaultEmpty();
            });
      },
    );
  }
}
