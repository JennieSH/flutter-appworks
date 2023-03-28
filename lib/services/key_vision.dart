import 'package:flutter_appworks/models/key_vision.dart';

List<KeyVision> getKeyVisionList() {
  return List.filled(
    6,
    KeyVision(
        productId: 201807242228,
        picture:
            'https://images.unsplash.com/photo-1523496922380-91d5afba98a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80'),
  );
}
