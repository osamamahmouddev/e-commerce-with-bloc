import 'package:equatable/equatable.dart';

enum StateType { INITIAL, SUCCESS, ERROR, LOADING }

class StateBox<T> extends Equatable {
  final StateType stateType;
  final T? data;
  final String? message;
  const StateBox({required this.stateType, this.message, this.data});
  bool get isLoading => stateType == StateType.LOADING;
  bool get isInitial => stateType == StateType.INITIAL;
  bool get isSuccess => stateType == StateType.SUCCESS;
  bool get isError => stateType == StateType.ERROR;

  factory StateBox.initial() => StateBox(stateType: StateType.INITIAL);

  factory StateBox.loading() => StateBox(stateType: StateType.LOADING);

  factory StateBox.success({required T data}) =>
      StateBox(stateType: StateType.SUCCESS, data: data);

  factory StateBox.error({required String message}) =>
      StateBox(stateType: StateType.ERROR, message: message);

  @override
  List<Object?> get props => [stateType, data, message];
}
