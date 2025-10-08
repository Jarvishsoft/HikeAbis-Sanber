import 'package:envied/envied.dart';

// part 'open_ai.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
      varName:
          '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')
  static String apiKey = Env.apiKey;
}
