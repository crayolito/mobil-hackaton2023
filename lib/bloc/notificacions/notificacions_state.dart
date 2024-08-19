part of 'notificacions_bloc.dart';

class NotificacionsState extends Equatable {
  final AuthorizationStatus status;
  final List<PushMessage> notificacions;
  final String token;

  const NotificacionsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notificacions = const [],
    this.token = '',
  });

  NotificacionsState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notificacions,
    String? token,
  }) {
    return NotificacionsState(
      status: status ?? this.status,
      notificacions: notificacions ?? this.notificacions,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [status, notificacions, token];
}
