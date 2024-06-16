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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late RemoteTodosCubit cubit;

  @override
  void initState() {
    cubit = RemoteTodosCubit.get(context);
    cubit.getTodosList(reset: true);
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
      title: MText(text: AppStrings.home),
    );
  }

  Widget getBody() {
    return BlocConsumer<RemoteTodosCubit, RemoteTodosStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is RemoteTodosLoading) {
          return const DefaultLoading();
        }
        if (state is RemoteTodosFailed) {
          return const DefaultError();
        }
        if (state is RemoteTodosSuccess) {
          return Conditional.single(
            context: context,
            conditionBuilder: (context) => state.todos.isNotEmpty,
            widgetBuilder: (context) {
              return MyListView<Todo>(
                fetchData: () => cubit.getTodosList(),
                list: state.todos,
                noMoreData: state.noMoreData,
                itemBuilder: (BuildContext context, Todo todo) {
                  return TodoWidget(todo: todo);
                },
              );
            },
            fallbackBuilder: (context) {
              return const DefaultEmpty();
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
