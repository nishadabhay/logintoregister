
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'message': 'what is your name',
      'name' : 'Abhay'
    },
    'hi_IN' : {
      'message': 'आपका क्या नाम है',
      'name' : 'मेरा नाम अभय है'
    },
  };


}
