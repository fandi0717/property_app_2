part of 'account_bloc.dart';
abstract class AccountState {
  const AccountState();
}

class AccountInitial extends AccountState {
  const AccountInitial();
}
class AccountLoading extends AccountState {
  const AccountLoading();
}
class AccountLoaded extends AccountState {
  const AccountLoaded();
}
class AccountError extends AccountState {
  final Exception exception;
  const AccountError(this.exception);
}

