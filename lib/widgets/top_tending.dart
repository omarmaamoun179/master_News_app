
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/models/news_model.dart';
import 'package:news_app_flutter_course/providers/news_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../inner_screens/blog_details.dart';
import '../inner_screens/news_details_webview.dart';
import '../services/utils.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsprovider = Provider.of<NewsModel>(context);

    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
   
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NewsDetailsScreen.routeName ,arguments: newsprovider.publishedAt);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl: newsprovider.urlToImage,
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  newsprovider.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: NewsDetailsWebView(
                                url: newsprovider.url,
                              ),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                      icon: Icon(
                        Icons.link,
                        color: color,
                      )),
                  const Spacer(),
                  SelectableText(
                   newsprovider.dateToShow,
                    style: GoogleFonts.montserrat(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
