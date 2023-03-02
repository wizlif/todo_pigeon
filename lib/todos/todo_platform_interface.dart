import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:todo_pigeon/todos/todo_pigeon.dart';

import 'i_todo_api.dart';

abstract class TodoPlatform extends PlatformInterface implements ITodoApi {
  TodoPlatform() : super(token: _token);

  static final _token = Object();

  static TodoPlatform _instance = TodoPigeon();

  /// The default instance of [TodoPlatform] to use.
  ///
  /// Defaults to [TodoPigeon].
  static TodoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TodoPlatform] when
  /// they register themselves.
  static set instance(TodoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
