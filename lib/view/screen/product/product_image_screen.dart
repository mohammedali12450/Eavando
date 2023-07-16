import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/product_details_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/provider/splash_provider.dart';
import 'package:flutter_axtro_soft_ecommerce/theme/light_theme.dart';
import 'package:flutter_axtro_soft_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';

class ProductImageScreen extends StatefulWidget {
  final String title;
  final List<dynamic> imageList;
  ProductImageScreen({required this.title, required this.imageList});

  @override
  _ProductImageScreenState createState() => _ProductImageScreenState();
}

class _ProductImageScreenState extends State<ProductImageScreen> {
  late int pageIndex;
  late PageController _pageController;
  late int colorIndex;
  late int imagesToEachColor;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    pageIndex = Provider.of<ProductDetailsProvider>(context, listen: false)
            .imageSliderIndex ??
        0;
    colorIndex = Provider.of<ProductDetailsProvider>(context, listen: false)
            .colorIndex ??
        0;
    imagesToEachColor =
        Provider.of<ProductDetailsProvider>(context, listen: false).productDetailsModel?.colors!.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(title: widget.title),
        Expanded(
          child: Stack(
            children: [
              RawKeyboardListener(
                autofocus: true,
                onKey: (key) {
                  setState(() {
                    if (key.runtimeType == RawKeyDownEvent) {
                      //right
                      if (key.data.logicalKey ==
                          LogicalKeyboardKey.arrowRight) {
                        if (pageIndex < widget.imageList.length - 1) {
                          pageIndex++;
                        }
                      }
                      //left
                      else if (key.data.logicalKey ==
                          LogicalKeyboardKey.arrowLeft) {
                        if (pageIndex > 0) {
                          pageIndex--;
                        }
                      }
                    }
                  });
                },
                focusNode: FocusNode(),
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(imagesToEachColor == 0
                          ? '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.productImageUrl ?? ""}'
                              '/${widget.imageList[pageIndex]}'
                          : '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.productImageUrl ?? ""}/'
                              '${Provider.of<ProductDetailsProvider>(context, listen: false).productDetailsModel?.colors?[colorIndex].name ?? ""}'
                              '/${widget.imageList[pageIndex]}'),
                      initialScale: PhotoViewComputedScale.covered,
                      heroAttributes:
                          PhotoViewHeroAttributes(tag: index.toString()),
                    );
                  },
                  backgroundDecoration:
                      BoxDecoration(color: Theme.of(context).highlightColor),
                  itemCount: widget.imageList.length,
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                (event.expectedTotalBytes ?? 0),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  pageController: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      pageIndex = index;
                      print(index);
                    });
                  },
                ),
              ),
              pageIndex != 0
                  ? Positioned(
                      left: 10,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme
                                  ?.primary ??
                              primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (pageIndex > 0) {
                                pageIndex--;
                                // _pageController.animateToPage(pageIndex-1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                              }
                            });
                          },
                          child: Icon(Icons.chevron_left_outlined, size: 35),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              pageIndex != widget.imageList.length - 1
                  ? Positioned(
                      right: 10,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme
                                  ?.primary ??
                              primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (pageIndex < widget.imageList.length) {
                                pageIndex++;
                                // _pageController.animateToPage(pageIndex+1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                              }
                            });
                          },
                          child: Icon(Icons.chevron_right_outlined, size: 35),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ]),
    );
  }
}
