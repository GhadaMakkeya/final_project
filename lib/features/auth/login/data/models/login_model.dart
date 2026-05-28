class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  LoginResponse({
    required this.accessToken, 
    required this.refreshToken, 
    required this.expiresAt
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['token'] ?? '', 
      refreshToken: json['refreshToken'] ?? '',
      expiresAt: DateTime.tryParse(json['expiresAt'] ?? "") 
                 ?? DateTime.now().add(const Duration(days: 1)),
    );
  }
}