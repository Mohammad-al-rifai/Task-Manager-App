part of 'app_cubit.dart';

@immutable
sealed class AppStates {}

final class AppInitialState extends AppStates {}

final class ChangeBottomNavState extends AppStates {
  final int index;

  ChangeBottomNavState({required this.index});
}
