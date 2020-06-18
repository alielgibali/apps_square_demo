import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Images extends StatelessWidget {
  final List<String> items;
  Images(this.items);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          child: Swiper(
            pagination: SwiperPagination(
              alignment: Alignment.bottomLeft,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeInImage(
                placeholder: AssetImage('assets/images/loading.jpg'),
                image: NetworkImage(
                  items[index],
                ),
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          left: 5,
          top: 5,
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.star_border),
            onPressed: () {},
          ),
        ),
        Positioned(
          left: 50,
          top: 5,
          child: IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {},
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
