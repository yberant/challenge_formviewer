import 'package:form_validator/form_validator.dart';

class LocaleEs implements FormValidatorLocale {
  const LocaleEs();

  @override
  String name() => 'es';

  @override
  String minLength(String v, int n) =>
      'El campo debe tener al menos $n caracteres';

  @override
  String maxLength(String v, int n) =>
      'El campo debe tener como máximo $n caracteres';

  @override
  String email(String v) => 'El campo no es un correo electrónico válido';

  @override
  String phoneNumber(String v) => 'El campo no es un número de teléfono válido';

  @override
  String required() => 'El campo es obligatorio';

  @override
  String ip(String v) => 'El campo no es una dirección IP válida';

  @override
  String ipv6(String v) => 'El campo no es una dirección IPv6 válida';

  @override
  String url(String v) => 'El campo no es una dirección URL válida';
}
