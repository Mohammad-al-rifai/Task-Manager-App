import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/components/my_text.dart';
import '../../core/utils/resources/color_manager.dart';
import '../../core/utils/resources/values_manager.dart';
import '../../domain/models/responses/todos/todos_model.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: MText(text: todo.id.toString()),
        title: MText(
          text: todo.todo ?? '',
        ),
        trailing: Icon(
          todo.completed!
              ? CupertinoIcons.checkmark_circle_fill
              : CupertinoIcons.checkmark_circle,
          color: todo.completed!
              ? ColorManager.success
              : ColorManager.lightGrey.withOpacity(.3),
          size: todo.completed! ? AppSize.s25 : AppSize.s18,
        ),
      ),
    );
  }
}
