import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchandisePage extends StatelessWidget {
  // Function to launch WhatsApp
  Future<void> _launchWhatsApp() async {
    final url = Uri.parse('https://wa.me/6285746322220'); // WhatsApp link format
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  // Sample list of merchandise
  final List<Map<String, String>> merchandiseList = [
    {
      'name': 'Merch Week Die First 4',
      'price': 'Rp. 150.000',
      'image': "assets/jualan1.jpg", // Local image asset
    },
    {
      'name': 'Merch Week Die Second 4',
      'price': 'Rp. 200.000',
      'image': 'assets/jualan2.jpg',
    },
    {
      'name': 'Merch Week Die Third 4',
      'price': 'Rp. 250.000',
      'image': 'assets/jualan3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        title: const Text('Merchandise', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 22, 22, 22),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: merchandiseList.length, // Use the length of the list
          itemBuilder: (context, index) {
            // Access item data from the list
            final item = merchandiseList[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item image using Image.asset
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      item['image']!, // Use local image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Item name
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Item price
                        Text(
                          item['price']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // "Buy" button
                        ElevatedButton(
                          onPressed: _launchWhatsApp, // Trigger the WhatsApp launch
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          ),
                          child: const Text(
                            'Buy',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.grey[400]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
