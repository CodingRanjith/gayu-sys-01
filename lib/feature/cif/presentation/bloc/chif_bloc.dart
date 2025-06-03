// lib/feature/cif/presentation/bloc/chif_bloc.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/Model/api_core/AsyncResponseHandler.dart';
import 'package:newsee/feature/cif/domain/model/user/chif_response_model.dart';
import 'package:newsee/feature/cif/domain/repository/chif_repository.dart';

part 'chif_event.dart';
part 'chif_state.dart';

final class ChifBloc extends Bloc<ChifEvent, ChifState> {
  final ChifRepository chifRepository;

  ChifBloc({required this.chifRepository}) : super(ChifState.init()) {
    on<SearchCif>(_onSearchCif);
  }

  Future<void> _onSearchCif(SearchCif event, Emitter<ChifState> emit) async {
    emit(state.copyWith(status: ChifStatus.loading));

    final response = await chifRepository.searchCif(event.request);

    if (response.isRight()) {
      emit(
        state.copyWith(
          status: ChifStatus.success,
          chifResponseModel: response.right,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: ChifStatus.failure,
          errorMessage: response.left.message,
        ),
      );
    }
  }
}
