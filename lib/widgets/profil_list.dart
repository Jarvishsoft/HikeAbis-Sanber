import 'package:flutter/material.dart';

class ProfilList extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? ontap;

  const ProfilList({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // dense: true,
      onTap: ontap,
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
    );
  }
}
