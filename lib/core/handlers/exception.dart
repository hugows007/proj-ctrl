class ExceptionHandler {
  final Object error;
  final StackTrace stackTrace;

  ExceptionHandler(this.error, this.stackTrace) {
    print("=================== ERROR ===================");
    print(error);
    print(stackTrace);
  }
}
