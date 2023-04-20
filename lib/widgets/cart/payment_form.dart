import 'package:flutter/material.dart';
import 'package:flutter_appworks/widgets/cart/checkout_field.dart';

const timeOptions = ["08:00-12:00", "14:00-18:00", "不指定"];

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  // https://gist.github.com/PeterPaulez/64335d12adbe99430996c3270fa96ae9
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController =
      TextEditingController(text: 'Jennie');
  final TextEditingController _emailController =
      TextEditingController(text: 'hello@world.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '0912345678');
  final TextEditingController _addressController =
      TextEditingController(text: 'Taiwan');
  final TextEditingController _creditCardNumberController =
      TextEditingController(text: '4111 1111 1111 1111');
  final TextEditingController _expirationDateController =
      TextEditingController(text: '01/23');
  final TextEditingController _ccvController =
      TextEditingController(text: '123');
  String time = timeOptions[0];

  bool _checkValidateStatus() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      return true;
    }
    return false;
  }

  void _onSummit() {
    bool _isValid = _checkValidateStatus();
    if (_isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Done!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // for get FormState
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('訂購資料'),
          const Divider(
            thickness: 1,
            height: 36,
            color: Colors.black12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('收件人姓名'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _nameController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('Email'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _emailController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('手機'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _phoneController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('地址'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _addressController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('配送時間'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                    children: timeOptions
                        .map(
                          (option) => SizedBox(
                            width: 180,
                            child: RadioListTile(
                              title: Text(option),
                              value: option,
                              groupValue: time,
                              onChanged: (value) {
                                setState(() {
                                  time = value!;
                                });
                              },
                            ),
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('付款資料'),
          const Divider(
            thickness: 1,
            height: 36,
            color: Colors.black12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('信用卡號碼'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _creditCardNumberController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('有效日期'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _expirationDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text('安全碼'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: _ccvController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '內容不得為空';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 64),
          Align(
            alignment: Alignment.centerRight,
            child: CheckoutField(
              onPressed: _onSummit,
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
