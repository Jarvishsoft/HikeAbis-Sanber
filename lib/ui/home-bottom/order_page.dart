import 'package:flutter/material.dart';
import 'package:hike_abis/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:hike_abis/providers/order_provider.dart';

class BookingListPage extends StatelessWidget {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Booking',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                "Belum ada pesanan. Silahkan booking terlebih dahulu.",
                style: TextStyle(fontSize: 12, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFF6A9EFF),
                              child: Icon(
                                Icons.hiking,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                order.nama,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                            color: Colors.grey, thickness: 1, height: 20),
                        InfoRow(label: "NIK", value: order.nik),
                        InfoRow(label: "No. Telp", value: order.noTelp),
                        InfoRow(label: "Email", value: order.email),
                        InfoRow(label: "Usia", value: "${order.usia} tahun"),
                        InfoRow(label: "Alamat", value: order.alamat),
                        const SizedBox(height: 15),
                        // Row(
                        //   // mainAxisSize: MainAxisSize.min,
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Expanded(
                        //       child: ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: const Color(0xFF6A9EFF),
                        //           minimumSize: const Size(double.infinity, 45),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //         ),
                        //         onPressed: () {},
                        //         child: const Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Icon(
                        //               Icons.next_plan_outlined,
                        //               color: Colors.white,
                        //               size: 28,
                        //             ),
                        //             SizedBox(width: 15),
                        //             Text(
                        //               'Lanjutkan pembayaran',
                        //               style: TextStyle(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.bold,
                        //                   color: Colors.white),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 10), // Jarak antar tombol
                        //     IconButton(
                        //         alignment: Alignment.topRight,
                        //         onPressed: () {
                        //           Provider.of<OrderProvider>(context,
                        //                   listen: false)
                        //               .editDialog(context, index);
                        //         },
                        //         icon: const Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Icon(Icons.edit_attributes_rounded,
                        //                 size: 20, color: Colors.black54),
                        //             Text('Edit',
                        //                 style: TextStyle(fontSize: 11)),
                        //           ],
                        //         )),
                        //     IconButton(
                        //         alignment: Alignment.topRight,
                        //         onPressed: () {
                        //           Provider.of<OrderProvider>(context,
                        //                   listen: false)
                        //               .deleteDialog(context, index);
                        //         },
                        //         icon: const Column(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Icon(Icons.delete_sweep_rounded,
                        //                 size: 20, color: Colors.black54),
                        //             Text('Hapus',
                        //                 style: TextStyle(fontSize: 11)),
                        //           ],
                        //         )),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6A9EFF),
                                  minimumSize: const Size(double.infinity, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.next_plan_outlined,
                                      color: Colors.white,
                                      size: 20, // Ukuran ikon lebih kecil
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Text(
                                        'Lanjutkan pembayaran',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10), // Jarak antar tombol
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6A9EFF),
                                padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    left: 10,
                                    right:
                                        10), // Padding untuk memperkecil tombol
                                minimumSize:
                                    const Size(0, 40), // Ukuran minimum tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .editDialog(context, index);
                              },
                              icon: const Icon(
                                color: Colors.white,

                                Icons.edit,
                                size: 16, // Ukuran ikon lebih kecil
                              ),
                              label: const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ), // Ukuran teks kecil
                              ),
                            ),
                            const SizedBox(width: 10), // Jarak antar tombol
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    left: 10,
                                    right:
                                        10), // Padding untuk memperkecil tombol
                                minimumSize:
                                    const Size(0, 40), // Ukuran minimum tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .deleteDialog(context, index);
                              },
                              icon: const Icon(
                                color: Colors.white,

                                Icons.delete,
                                size: 16, // Ukuran ikon lebih kecil
                              ),
                              label: const Text(
                                'Hapus',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ), // Ukuran teks kecil
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label :",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
