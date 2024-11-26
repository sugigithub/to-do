import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/error_screen.dart';
import 'package:todo_app/screens/new_task_screen.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/screens/task_list_screen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MyHomePage(title: 'title'));
          },
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ProfileScreen());
          },
        ),
        GoRoute(
          path: '/new_task',
          name: 'new_task',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: NewTaskScreen(
              selectPage: () {},
            ));
          },
        ),
        GoRoute(
          path: '/task_list',
          name: 'task_list',
          pageBuilder: (context, state) {
            return const MaterialPage(child: TaskListScreen());
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorScreen());
      });
}
