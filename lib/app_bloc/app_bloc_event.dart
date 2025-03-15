abstract class AppBlocEvent {}

class AppBlocInitEvent extends AppBlocEvent {}

class ThemeChangeEvent extends AppBlocEvent {

  final bool isDarkMode;

  ThemeChangeEvent({required this.isDarkMode});

}