part of './lead_submit_bloc.dart';

enum SubmitStatus { init, loading, success, failure }

class LeadSubmitState extends Equatable {
  final String? leadId;
  final LeadSubmitRequest? leadSubmitRequest;
  final SubmitStatus leadSubmitStatus;
  LeadSubmitState({
    required this.leadId,
    required this.leadSubmitRequest,
    required this.leadSubmitStatus,
  });

  factory LeadSubmitState.init() => LeadSubmitState(
    leadId: '',
    leadSubmitRequest: null,
    leadSubmitStatus: SubmitStatus.init,
  );

  LeadSubmitState copyWith({
    String? leadId,
    LeadSubmitRequest? leadSubmitRequest,
    SubmitStatus? leadSubmitStatus,
  }) {
    return LeadSubmitState(
      leadId: leadId ?? this.leadId,
      leadSubmitRequest: leadSubmitRequest ?? this.leadSubmitRequest,
      leadSubmitStatus: leadSubmitStatus ?? this.leadSubmitStatus,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [leadId, leadSubmitRequest, leadSubmitStatus];
}
