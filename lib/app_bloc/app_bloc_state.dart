class AppBlocState {

  bool isDarkMode ;
  int sprint;

  AppBlocState({
    this.isDarkMode = false,
    this.sprint = 1,
  });

  AppBlocState copyWith({bool? isDarkMode,int? sprint}) {
    return AppBlocState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      sprint:sprint??this.sprint
    );
  }

}
