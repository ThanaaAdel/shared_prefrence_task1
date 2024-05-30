class LoginState {
  final bool isLoading;
  final String? userName;
  final String? userBirthDate;
  final String? error;

  LoginState({
    required this.isLoading,
    this.userName,
    this.userBirthDate,
    this.error,
  });

  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      userName: null,
      userBirthDate: null,
      error: null,
    );
  }

  LoginState copyWith({
    bool? isLoading,
    String? userName,
    String? userBirthDate,
    String? error,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      userName: userName ?? this.userName,
      userBirthDate: userBirthDate ?? this.userBirthDate,
      error: error ?? this.error,
    );
  }
}
