import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './progress_event.dart';
part './progress_state.dart';

final class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressState.initial()) {
    on<ProgressInit>(onInitDownload);
    on<Progressing>(onDowloadProgress);
  }

  Future<void> onInitDownload(ProgressInit event, Emitter emit) async {
    emit(ProgressState(downloadProgress: 0.0));
  }

  Future<void> onDowloadProgress(Progressing event, Emitter emit) async {
    await Future.delayed(Duration(seconds: 5));
    emit(ProgressState(downloadProgress: 0.5));
  }
}
