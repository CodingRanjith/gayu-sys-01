// lib/feature/cif/presentation/bloc/chif_event.dart
part of 'chif_bloc.dart';

abstract class ChifEvent extends Equatable {
  const ChifEvent();

  @override
  List<Object?> get props => [];
}

class SearchCif extends ChifEvent {
  final Map<String, dynamic> request;

  const SearchCif({required this.request});

  @override
  List<Object?> get props => [request];
}
