// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

enum AuthenticationStatus { loading, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status});

  final AuthenticationStatus status;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
