import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/feature/dedupe/data/repository/dedupe_search_repo_impl.dart';
import 'package:newsee/feature/dedupe/domain/model/deduperequest.dart';
import 'package:newsee/feature/dedupe/domain/model/deduperesponse.dart';
import 'package:newsee/feature/dedupe/domain/repositoy/deduperepository.dart';

part 'dedupe_event.dart';
part 'dedupe_state.dart';

class DedupeBloc extends Bloc<DedupeEvent, DedupeState> {
  DedupeBloc():super(DedupeState()) {
    on<FetchDedupeEvent>(dedupeFetch);
  }

  Future<void> dedupeFetch(FetchDedupeEvent event, Emitter emit) async {
    emit(state.copyWith(status: DedupeFetchStatus.loading));
    final DedupeRequest dedupeReq =  event.request;
    DedupeRepository dedupeRepository = DedupeSearchRepositoryimpl();
    var responseHandler = await dedupeRepository.dedupeSearchforCustomer(dedupeReq);
    if (responseHandler.isRight()) {
      emit(state.
        copyWith(
          status: DedupeFetchStatus.success,
          dedupeResponse: responseHandler.right,
        )
      );
    } else {
      emit(state.
        copyWith(
          status: DedupeFetchStatus.failure,
          errorMsg: responseHandler.left.message,
        )
      );
    }
  }
}