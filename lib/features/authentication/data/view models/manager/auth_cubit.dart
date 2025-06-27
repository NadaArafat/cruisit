import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress;

  Future<void> signUpWithPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignUpError(message: e.code));
    } catch (e) {
      print(e.toString());
      emit(SignUpError(message: e.toString()));
    }
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      emit(SignInError(message: e.code));
    } catch (e) {
      print(e.toString());
      emit(SignInError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(SignOutError(message: e.toString()));
    }
  }
}
