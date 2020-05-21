import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  double height;
  List<AssetImage> ImageList;
  ImageSlider(this.height,this.ImageList);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: widget.height,
          child: Carousel(
            borderRadius: true,
            autoplayDuration: Duration(seconds: 2),
            showIndicator: false,
            boxFit: BoxFit.cover,
            images: widget.ImageList,
          ),
        ),
      ),
    );
  }
}
