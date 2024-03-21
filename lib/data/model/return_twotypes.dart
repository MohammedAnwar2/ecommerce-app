class Either<L, R> {
  final L? left;
  final R? right;

  Either.left(this.left) : right = null;
  Either.right(this.right) : left = null;

  // Added fold method
  T fold<T>(T Function(L) ifLeft, T Function(R) ifRight) {
    if (left != null) {
      return ifLeft(left as L); // Cast left to L for type safety
    } else {
      return ifRight(right as R); // Cast right to R for type safety
    }
  }
}
