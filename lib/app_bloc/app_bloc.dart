import '../project_setup.dart';

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  AppBloc() : super(AppBlocState()) {
    on<AppBlocInitEvent>(_init);
    on<ThemeChangeEvent>(_themeChange);

  }

  Future<void> _init(AppBlocInitEvent event, Emitter<AppBlocState> emit) async {
    if(storage.read(SessionManagerKeys.isDarkMode) == null) {
      storage.write(SessionManagerKeys.isDarkMode, false);
      emit(state.copyWith(isDarkMode: false));
    }else{
      emit(state.copyWith(isDarkMode: storage.read(SessionManagerKeys.isDarkMode)));
    }
  }

  Future<void> _themeChange(ThemeChangeEvent event, Emitter<AppBlocState> emit) async {
    storage.write(SessionManagerKeys.isDarkMode, event.isDarkMode);
    emit(state.copyWith(isDarkMode: event.isDarkMode));
  }

}
