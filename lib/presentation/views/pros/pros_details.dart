// ignore: unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profinder/domain/pros/pros_model.dart';

class ProsDetails extends StatefulWidget {
  final Pros pro;

  const ProsDetails({super.key, required this.pro});

  @override
  // ignore: library_private_types_in_public_api
  _ProsDetailsState createState() => _ProsDetailsState();
}

class _ProsDetailsState extends State<ProsDetails> {
  int _rating = 0; // Current rating, initialized to 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pro.firstname} ${widget.pro.lastname} Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('First Name', widget.pro.firstname),
            _buildDetailItem('Last Name', widget.pro.lastname),
            _buildDetailItem('Specialty', widget.pro.specialty),
            const SizedBox(height: 16.0),
            _buildRatingSection(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _rating == 0 ? null : _submitRating,
              child: const Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate ${widget.pro.firstname}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 1; i <= 5; i++)
              GestureDetector(
                onTap: () => _setRating(i),
                child: Icon(
                  Icons.star,
                  color: i <= _rating ? Colors.yellow : Colors.grey,
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _submitRating() async {
    const apiUrl = 'https://qcqc.fr/profs/?list=votes';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'id':
              widget.pro.id.toString(), // Assuming id is part of the Pros model
          'rating': _rating.toString(),
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Rating submitted'),
            content: Text(
                'You rated ${widget.pro.firstname} ${widget.pro.lastname} $_rating stars.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Handle errors
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content:
                const Text('Failed to submit rating. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Handle network or other exceptions
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Failed to submit rating. Please check your internet connection.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
