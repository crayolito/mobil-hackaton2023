import 'package:flutter/material.dart';
import 'package:notification/models/categories_models.dart';
import 'package:notification/presentation/screens/categoryItem.dart';

class CategoriasSelection extends StatelessWidget {
  const CategoriasSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/categoriasImage.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
            ),
            const ContainerPresentation(),
            SizedBox(
              height: 5,
            ),
            Flexible(child: SpaceBuildCategories())
          ],
        ),
      ),
    );
  }
}

class ContainerPresentation extends StatelessWidget {
  const ContainerPresentation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.70),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30,
              color: const Color(0xFFD3D3D3).withOpacity(.84))
        ],
        border: Border.all(color: Color.fromARGB(255, 32, 109, 35), width: 3),
      ),
      child: Center(
        child: Text(
          'Categorias',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: 'Courier',
              fontWeight: FontWeight.bold,
              fontSize: 29,
              color: Color.fromARGB(255, 32, 109, 35)),
        ),
      ),
    );
  }
}

class SpaceBuildCategories extends StatelessWidget {
  const SpaceBuildCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.67,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categoriesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 3.5 / 3,
        ),
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categoriesList[index],
          );
        },
      ),
    );
  }
}
