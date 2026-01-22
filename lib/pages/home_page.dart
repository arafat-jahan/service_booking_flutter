import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../data/service_list.dart';
import 'service_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Service"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          Service service = services[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailsPage(service: service),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      service.image,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // ICON + NAME
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(service.icon, size: 30),
                        const SizedBox(width: 12),
                        Text(
                          service.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
