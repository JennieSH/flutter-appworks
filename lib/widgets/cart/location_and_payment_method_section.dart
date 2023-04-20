import 'package:flutter/material.dart';

const List<String> locationList = ['台灣及離島'];
const List<String> paymentMethodList = ['信用卡'];

class LocationAndPaymentMethodSection extends StatefulWidget {
  const LocationAndPaymentMethodSection({
    super.key,
  });

  @override
  State<LocationAndPaymentMethodSection> createState() =>
      _LocationAndPaymentMethodSectionState();
}

class _LocationAndPaymentMethodSectionState
    extends State<LocationAndPaymentMethodSection> {
  String location = locationList.first;
  String paymentMethod = paymentMethodList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.black12,
      child: Row(
        children: [
          const Text('配送國家'),
          const SizedBox(width: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton(
              underline: Container(color: Colors.transparent),
              value: location,
              items: locationList
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  location = value!;
                });
              },
            ),
          ),
          const SizedBox(width: 72),
          const Text('付款方式'),
          const SizedBox(width: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton(
              underline: Container(color: Colors.transparent),
              value: paymentMethod,
              items: paymentMethodList
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(
                  () {
                    paymentMethod = value!;
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
