import 'package:get/get.dart';

class MessagesConfig extends Translations {
  Map<String, Map<String, String>> get keys => {
    'pt_BR': {}
      ..addAll(buttons)
      ..addAll(labels)
      ..addAll(hints)
      ..addAll(dialog)

  };

  get buttons {
    return {
      'button_cancel': 'Cancelar',
    };
  }

  get labels {
    return {
      'label_cpf': 'CPF',
    };
  }

  get hints {
    return {
      'hint_cpf': 'Insira seu CPF',
    };
  }

  get dialog {
    return {
      'dialog_title_success': 'Oba!',
    };
  }
}
