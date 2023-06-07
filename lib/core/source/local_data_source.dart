// Package imports:
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  bool get isLoggedIn;
  String? get accessToken;
  String? get refreshToken;

  Future<void> clear();
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl();

  @override
  String? get accessToken => "accessToken";

  @override
  Future<void> clear() async {
    print("clean");
  }

  @override
  bool get isLoggedIn => true;

  @override
  String? get refreshToken => "refreshToken";
}
