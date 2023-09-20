enum AuthenticationState { loading, authenticated, unauthenticated }

// class AuthenticationState extends Equatable {
//   const AuthenticationState({
//     this.status = AuthenticationStatus.loading,
//   });

//   final AuthenticationStatus status;

//   @override
//   List<Object> get props => [status];

//   AuthenticationState copyWith({
//     AuthenticationStatus? status,
//   }) {
//     return AuthenticationState(
//       status: status ?? this.status,
//     );
//   }
// }
