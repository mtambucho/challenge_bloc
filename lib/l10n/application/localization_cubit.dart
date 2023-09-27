import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(super.initialState);
}

class LocalizationState extends Equatable {
  const LocalizationState({required this.locale});

  final Locale locale;

  LocalizationState copyWith({
    Locale? locale,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [locale];
}
