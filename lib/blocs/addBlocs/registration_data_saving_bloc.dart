import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/auth_services.dart';

import '../../services/firestore_collections.dart';

class RegistrationDataBloc extends Bloc<RegistrationDataEvent, RegistrationDataState> {
  RegistrationDataBloc() : super(RegistrationDataInitial()) {
    final CollectionNames cn = CollectionNames();

    on<SaveRegistrationData>((event, emit) async {
      emit(RegistrationDataSaveProgress());
      final AuthenticationService auth = AuthenticationService();
      String? userId = auth.currentUser()?.uid;
      try {
        await cn.appRegistrationsDb.doc(userId).set(event.registrationData);
        await cn.appRegistrationsDb.doc(userId).collection('userLogs').add({
          "action": "Signup using email password on app",
          "timestamp": FieldValue.serverTimestamp(),
        }).whenComplete(() => emit(RegistrationDataSaveSuccess()));
      } on PlatformException catch (e) {
        log('registration_data_bloc.dart 1', name: "[Platform Exception] >>", error: e);
        emit(RegistrationDataSaveFailure(e));
      } on FirebaseException catch (e) {
        log('registration_data_bloc.dart 2', name: "[Firebase Exception] >>", error: e);
        emit(RegistrationDataSaveFailure(e));
      }
    });
  }
}

//events and states
abstract class RegistrationDataEvent {}

abstract class RegistrationDataState {}

//events implementation
class SaveRegistrationData extends RegistrationDataEvent {
  Map<String, dynamic> registrationData;
  SaveRegistrationData({required this.registrationData});
}

//states implementation
class RegistrationDataInitial extends RegistrationDataState {}

class RegistrationDataSaveProgress extends RegistrationDataState {}

class RegistrationDataSaveSuccess extends RegistrationDataState {}

class RegistrationDataSaveFailure extends RegistrationDataState {
  final dynamic error;

  RegistrationDataSaveFailure(this.error);
}
