/* 
@author     : ganeshkumar.b  04/06/2025
@desc       : State Object for Dedupe Search
@param      : {DedupeFetchStatus status} - enum for Fetch status 
              {String errorMsg} - error message when service failure
              {DedupeResponse dedupeResponse} - return DedupeResponse
 */

part of 'dedupe_bloc.dart';

enum DedupeFetchStatus { init, loading, success, failure }

class DedupeState extends Equatable {
  final DedupeFetchStatus? status;
  final String? errorMsg;
  final DedupeResponse? dedupeResponse;

  DedupeState({
    this.status,
    this.errorMsg,
    this.dedupeResponse,
  });

  DedupeState copyWith({
    DedupeFetchStatus? status,
    String? errorMsg,
    DedupeResponse? dedupeResponse,
  }) {
    return DedupeState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      dedupeResponse: dedupeResponse ?? this.dedupeResponse,
    );
  }
  
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, errorMsg, dedupeResponse];
}
