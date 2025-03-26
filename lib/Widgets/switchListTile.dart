import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SwitchListTileWidget extends StatelessWidget {
  final String title;
  final RxBool value;
  final ValueChanged<bool> onChanged;

  const SwitchListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: () {},
      trailing: Obx(() => Switch(
            value: value.value,
            onChanged: onChanged,
            activeColor: Colors.transparent,
            inactiveThumbColor: Colors.green,
            activeTrackColor: Colors.amber,
            thumbColor: WidgetStateProperty.all(Colors.yellow),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),
    );
  }
}
