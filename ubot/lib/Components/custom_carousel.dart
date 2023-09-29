import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late PageController _pageController;

  List<String> images = [
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/30/5f/cc/bhavani-sagar-dam.jpg?w=1200&h=-1&s=1",
    "https://www.india.com/wp-content/uploads/2016/10/a-view-of-overflowing-himayat-sagar-dam-built-on-esi-a-tributary-of-musi-river-near-hyderabad1.jpg",
    "https://3.imimg.com/data3/MK/TO/MY-10413505/tehri-dam-and-maneri-bhali-stage-ii-hydel-project-in-uttarak-500x500.jpg",
    "https://c.ndtvimg.com/2023-07/8bnkk3h_bhakra-dam-ani_625x300_12_July_23.jpg",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/8f/f8/a5/view-of-dam.jpg?w=1200&h=-1&s=1"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          images[pagePosition],
        ),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
