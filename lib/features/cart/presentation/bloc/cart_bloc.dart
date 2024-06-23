import '../../domain/use_cases/cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUseCase cartUseCase;

  CartBloc({required this.cartUseCase}) : super(const CartInitial()) {
    on<CartEvent>(_cart);
  }

  Future<void> _cart(
    CartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    final result = await cartUseCase.call();
    result.fold(
      (exception) => emit(CartError(exception)),
      (_) => emit(const CartLoaded()),
    );
  }
}

      