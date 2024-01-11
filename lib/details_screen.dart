import 'package:flutflix/Widgets/back_btn.dart';
import 'package:flutflix/colors.dart';
import 'package:flutflix/constants.dart';
import 'package:flutflix/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class detailsScreen extends StatelessWidget {
const detailsScreen({super.key, required this.movies});
final Movies movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: backbtn(),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movies.title,
              style: GoogleFonts.belleza(
                   fontSize: 17,
                   fontWeight: FontWeight.w600,

              ),),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),

                ),
                child: Image.network('${constants.imagePath}${movies.posterPath}',
                  filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
                ),
              
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Text('Overview',
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,

                ),),
                const SizedBox(
                  height: 16,
                ),
                Text(movies.overview,style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,

                ),),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(
                          children: [
                            Text('Release date: ',
                            style: GoogleFonts.roboto( fontSize: 17,
                            fontWeight: FontWeight.bold),),
                            Text(movies.releaseDate,
                            style: GoogleFonts.roboto( fontSize: 17,
                            fontWeight: FontWeight.bold),)
                          ],

                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(
                          children: [
                            Text('Rating: ',
                            style: GoogleFonts.roboto(fontSize: 17,
                            fontWeight: FontWeight.bold,
                            ),),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('${movies.voteAverage.toStringAsFixed(1)}/10',
                            style: GoogleFonts.roboto(fontSize: 17,
                            fontWeight: FontWeight.bold,),)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),),
          )
        ],
      ),
    );
  }
}
