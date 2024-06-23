part of 'cart_bloc.dart';
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}
class CartLoading extends CartState {
  const CartLoading();
}
class CartLoaded extends CartState {
  const CartLoaded();
}
class CartError extends CartState {
  final Exception exception;
  const CartError(this.exception);
}

