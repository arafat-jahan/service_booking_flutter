import 'dart:developer';
import 'package:service_app/pages/booking_page.dart';

import '../models/service_model.dart';
import 'package:flutter/material.dart';



class ServiceDetailsPage extends StatelessWidget {

  final Service service;
  const ServiceDetailsPage({super.key, required this. service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image

          Image.network(
            service.image,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          
          
          //icon+name
          
          Padding(padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(service.icon,size:35),
                const SizedBox(width: 12,),
                Text(service.name, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
          
          ),
          //Description
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Professional service at your doorstep. Book now to get fast, reliable service from trained professionals.",
              style: TextStyle(fontSize: 16),

            ),
          ),

          const SizedBox(height: 20,),

          ///book now button

          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingPage(service: service),
                ),
                );
              }, child: const Text("Book Now",style: TextStyle(fontSize: 18),)),
            ),
          )


        ],
      ),
    );
  }
}
