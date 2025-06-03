// lib/feature/cif/presentation/bloc/chif_state.dart
part of 'chif_bloc.dart';

enum ChifStatus { initial, loading, success, failure }

class ChifState extends Equatable {
  final ChifStatus status;
  final ChifResponseModel? chifResponseModel;
  final String errorMessage;
  final bool isResponseValid;

  const ChifState({
    required this.status,
    this.chifResponseModel,
    this.errorMessage = '',
    this.isResponseValid = false,
  });

  factory ChifState.init() => const ChifState(status: ChifStatus.initial);

  ChifState copyWith({
    ChifStatus? status,
    ChifResponseModel? chifResponseModel,
    String? errorMessage,
    bool? isResponseValid,
  }) {
    return ChifState(
      status: status ?? this.status,
      chifResponseModel: chifResponseModel ?? this.chifResponseModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isResponseValid: isResponseValid ?? this.isResponseValid,
    );
  }

  @override
  List<Object?> get props => [
    status,
    chifResponseModel,
    errorMessage,
    isResponseValid,
  ];
}
