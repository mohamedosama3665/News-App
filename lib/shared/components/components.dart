import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(url: article['url'],)));},
  child:   Padding(

        padding: EdgeInsets.all(20),

        child: Row(

          children: [

            Container(

              width: 120,

              height: 120,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),

                  image: DecorationImage(

                      image: NetworkImage('${article['urlToImage']}'),

                      fit: BoxFit.cover)),

            ),

            SizedBox(

              width: 20,

            ),

            Expanded(

                child: Container(

              height: 120,

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      '${article['title']}',

                      style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: GoogleFonts.aBeeZee(color: Colors.grey),

                  ),

                ],

              ),

            )),

            SizedBox(

              width: 15,

            )

          ],

        ),

      ),
);

Widget myDivider() => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
