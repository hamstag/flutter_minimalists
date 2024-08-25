import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_minimalists/core/services/http_client/http_client.dart';
import 'package:flutter_minimalists/modules/auth/auth_model.dart';

typedef LoginRequest = ({String username, String password});
typedef AuthResponse = ({String token, AuthModel model});

class AuthService {
  final HttpClient httpClient;

  AuthService(this.httpClient);

  Future<ResponseDTO<AuthResponse>> login(LoginRequest request) async {
    ResponseDTO<AuthResponse> response;

    log('Login');
    await Future.delayed(Durations.extralong4);
    try {
      // make api login

      response = (
        didSuccess: true,
        statusCode: 200,
        message: null,
        data: (
          token: 'token1234',
          model: const AuthModel(
              id: "1234567890", firstName: "Hello", lastName: "Hamstag"),
        ),
      );
    } catch (e) {
      response = (
        didSuccess: false,
        statusCode: 400,
        message: 'Error: $e',
        data: null,
      );
    }

    return response;
  }

  Future<void> register() async {
    await Future.delayed(Durations.extralong4);

    log('Register');
  }

  Future<void> logout() async {
    await Future.delayed(Durations.extralong4);

    log('Logout');
  }

  Future<AuthResponse> authRefresh() async {
    await Future.delayed(Durations.extralong4);

    log('Auth Refresh');

    return (
      token: 'token1234',
      model: const AuthModel(
          id: "1234567890", firstName: "Hello", lastName: "Hamstag"),
    );
  }
}
