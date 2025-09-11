import 'package:news_app/core/utils/typedef.dart';

abstract class CommonUsecase<Type, Params> {
  ResultFuture<Type> call(Params params);
}