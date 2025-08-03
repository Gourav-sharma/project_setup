import '../project_setup.dart';

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  AppBloc() : super(AppBlocState()) {
    on<AppBlocInitEvent>(_init);
    on<ThemeChangeEvent>(_themeChange);

  }

  Future<void> _init(AppBlocInitEvent event, Emitter<AppBlocState> emit) async {

  }

  Future<void> _themeChange(ThemeChangeEvent event, Emitter<AppBlocState> emit) async {

  }

}
