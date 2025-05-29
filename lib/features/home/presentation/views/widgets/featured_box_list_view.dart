import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';

class FeaturedBoxListView extends StatelessWidget {
  final double listHeight;
  const FeaturedBoxListView({super.key, required this.listHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CustomBookImage(aspectRatio: 1.2 / 2),
      ),
    );
  }
}
