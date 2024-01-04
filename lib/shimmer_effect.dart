import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/shimmer.dart';

import './model/food.dart';

class ShimmmerEffect extends StatefulWidget {
  const ShimmmerEffect({super.key});

  @override
  State<ShimmmerEffect> createState() => _ShimmmerEffectState();
}

class _ShimmmerEffectState extends State<ShimmmerEffect> {
  List<Food> foods = [];
  List<Food> allfood = [
    Food(
        urlImage:
            "https://i.pinimg.com/originals/82/d4/92/82d4926dcf09dd4c73eb1a6c0300c135.jpg",
        title: "Carrot",
        description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
    Food(
        urlImage:
            "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
        title: "Cucumber",
        description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
    Food(
        urlImage:
            "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
        title: "Brinjal",
        description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
    Food(
        urlImage:
            "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
        title: "Flower",
        description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc"),
    Food(
        urlImage:
            "https://wallpapers.com/images/hd/naruto-pictures-3n3frmm4xs2y0nvv.jpg",
        title: "Lady Finger",
        description: "kadcsdkl cnad km akjdwe kclknsdcw lcm lcmskc")
  ];
  bool isLoading = false;
  Future loadData() async {
    foods = List.of(allfood);
    setState(() => isLoading = true);
    await Future.delayed(
        const Duration(
          seconds: 5,
        ),
        () {});
    foods = List.of(allfood);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: foods.length,
            itemBuilder: ((context, index) {
              if (isLoading) {
                return Shimmereffect();
              } else {
                final food = foods[index];

                return buildFood(food);
              }
            })));
  }

  Widget buildFood(Food food) => ListTile(
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(food.urlImage),
        ),
        title: Text(
          food.title,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(food.description, style: TextStyle(fontSize: 16)),
      );

  Widget Shimmereffect() {
    return ListTile(
      leading: ShimmerWidget.circular(
        width: 64,
        height: 64,
      ),
      title: ShimmerWidget.rectangular(
        height: 16,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      subtitle: ShimmerWidget.rectangular(height: 14),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;

  ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();
  ShimmerWidget.circular(
      {required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        // color: Colors.grey,
        decoration:
            ShapeDecoration(shape: shapeBorder, color: Colors.grey[400]!),
      ),
    );
  }
}
