import 'package:book/repositories/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShortcutBookWidegt extends StatelessWidget {
  ShortcutBookWidegt({super.key, required this.model});
  BookModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/image_default.jpg",
          height: 400,
          width: 250,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            model.nameBook ?? "Null data",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          model.author ?? "Null data",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const Text(
              "5.0",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
