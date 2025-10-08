import 'package:flutter/material.dart';
import 'package:hike_abis/models/order_model/order_model.dart';
import 'package:hike_abis/theme/theme.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModels> _ordersModels = [];

  List<OrderModels> get orders => _ordersModels;

  void addOrderModels(OrderModels order) {
    _ordersModels.add(order);
    notifyListeners();
  }

  void removeOrderModels(OrderModels order) {
    _ordersModels.remove(order);
    notifyListeners();
  }

  void editDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Edit Booking',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Ada yang salah dengan booking ini?',
            style: TextStyle(
              fontSize: 14,
              // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.blue, fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Batalkan',
                  style: TextStyle(color: textBlack, fontSize: 13),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Warning!',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Apakah kamu yakin ingin menghapus booking ini?',
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Hapus berdasarkan index
                removeOrderModels(orders[index]);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Booking berhasil dihapus')),
                );
              },
              child: const Center(
                child: Text(
                  'Hapus Booking',
                  style: TextStyle(color: Colors.red, fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Batalkan',
                  style: TextStyle(color: textBlack, fontSize: 13),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
