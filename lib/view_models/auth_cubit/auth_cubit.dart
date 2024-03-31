import 'package:ecommerce_app/services/auth_services.dart';
// import 'package:ecommerce_app/view_models/auth_cubit/auth_state.dart';
import 'package:ecommerce_app/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authService = AuthenticationServiceImpl();

  void signInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authService.signInWithEmailAndPassword(email, password);
      if (result) {
        emit(AuthSuccess());
      } else {
        //emit(AuthFaliure('Faild'));
             const Text("Error");

      }
    } catch (e) {
      //emit(AuthFaliure(e.toString()));
           const Text("Error");

    }
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authService.signUpWithEmailAndPassword(email, password);
      if (result) {
        emit(AuthSuccess());
      } else {
       // emit(AuthFaliure('Faild'));
            const Text("Error");

      }
    } catch (e) {
     // emit(AuthFaliure(e.toString()));
     const Text("Error");
    }
  }

  Future<void> logOut() async {
    await authService.signOut();
    emit(AuthSuccess());
  }

  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    try {
      var user = await authService.currentUser();
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }
}