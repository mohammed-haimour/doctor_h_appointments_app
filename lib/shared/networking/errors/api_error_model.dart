import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? _message;
  final int? _code;
  @JsonKey(name: "data")
  final Map<String, dynamic>? errors;

  ApiErrorModel({String? message, int? code, this.errors})
      : _code = code,
        _message = message;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String? get getMessage => _message;
  int? get getCode => _code;

  String? get getErrors => getAllErrorMessages();

  /// Returns a String containing all the error messages, i can make it shorter but it's better to be like this for more readbility
  String? getAllErrorMessages() {
    if (errors == null || errors is List && (errors as List).isEmpty) {
      return _message;
    }

    if (errors is Map<String, dynamic>) {
      final errorMessage =
          (errors as Map<String, dynamic>).entries.map((entry) {
        final value = entry.value;
        return "${value.join(',')}";
      }).join('\n');

      return errorMessage;
    } else if (errors is List) {
      return (errors as List).join('\n');
    }

    return _message;
  }
}
