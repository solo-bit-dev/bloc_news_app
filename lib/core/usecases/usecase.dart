/// An abstract class that defines a contract for use cases in the application.
/// 
/// This class enforces a consistent structure for all use cases, ensuring that
/// each use case can be called with a set of parameters and returns a result
/// asynchronously.
/// 
/// Type parameters:
/// - `Type`: The type of data that the use case will return.
/// - `Params`: The type of parameters that the use case will accept.
abstract class UseCase<Type, Params> {
  
  /// Executes the use case with the given parameters.
  /// 
  /// This method must be implemented by any concrete subclass of `UseCase`.
  /// 
  /// Parameters:
  /// - `params` (optional): The parameters required to execute the use case.
  /// 
  /// Returns:
  /// A `Future` that resolves to a value of type `Type`.
  Future<Type> call({Params params});
}
