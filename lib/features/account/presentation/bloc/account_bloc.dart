import '../../domain/use_cases/account_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountUseCase accountUseCase;

  AccountBloc({required this.accountUseCase}) : super(const AccountInitial()) {
    on<AccountEvent>(_account);
  }

  Future<void> _account(
    AccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountLoading());
    final result = await accountUseCase.call();
    result.fold(
      (exception) => emit(AccountError(exception)),
      (_) => emit(const AccountLoaded()),
    );
  }
}

      