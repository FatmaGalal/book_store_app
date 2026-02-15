String firebaseAuthError(Object error) {
  final message = error.toString();

  if (message.contains('user-not-found')) {
    return 'User not found';
  }
  if (message.contains('invalid-credential')) {
    return 'Invalid credentials';
  }
  if (message.contains('weak-password')) {
    return 'Password is too weak';
  }
  if (message.contains('email-already-in-use')) {
    return 'Email already in use';
  }

  return 'Authentication failed';
}