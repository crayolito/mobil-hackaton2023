import 'package:flutter/material.dart';
import 'package:notification/models/categoria.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  double elevation = 18.0;

  void navigateToSpecificSearchScreen() {
    Navigator.pushNamed(context, widget.category.categoryLink);
    setState(() {
      elevation = 4.0;
    });

    Future.delayed(Duration(milliseconds: 100)).then((_) {
      setState(() {
        elevation = 18.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: GestureDetector(
        onTap: navigateToSpecificSearchScreen,
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: elevation,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    widget.category.iconLink,
                  ),
                ),
                const SizedBox(height: 10),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    widget.category.categoryTitle,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 32, 109, 35),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
