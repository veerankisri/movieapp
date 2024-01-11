import 'package:flutflix/API/api.dart';
import 'package:flutflix/Widgets/movies_slider.dart';
import 'package:flutflix/Widgets/trending_slider.dart';
import 'package:flutflix/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}



class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movies>> TrendingMovies;
  late Future<List<Movies>> TopRatedMovies;
  late Future<List<Movies>> UpcomingMovies;

@override
void initState(){
  super.initState();
  TrendingMovies = Api().getTrendingMovies();
  TopRatedMovies = Api().getTopRatedMovies();
 UpcomingMovies = Api().getUpcomingMovies();

}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/flutflix.png',
        fit: BoxFit.cover,
        height: 40,
        filterQuality: FilterQuality.high,),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding( 
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Trending Movies',
              style: GoogleFonts.aBeeZee(fontSize: 25),),
              SizedBox(
                height: 16,
              ),
            SizedBox(
              child: FutureBuilder(future: TrendingMovies, 
              builder: (context, snapshot){
                if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }else if(snapshot.hasData){
                 return  TrendingSlider(snapshot: snapshot,);

              }else{
                return const Center(child: CircularProgressIndicator());
              }}) 
            ),

                SizedBox(
                  height: 32,
                ),

                Text('Top Rated Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                SizedBox(
                  height: 16,
                ),
               SizedBox(
              child: FutureBuilder(future: TopRatedMovies, 
              builder: (context, snapshot){
                if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }else if(snapshot.hasData){
                 return  MoviesSlider(snapshot: snapshot,);

              }else{
                return const Center(child: CircularProgressIndicator());
              }}) 
            ),

                 SizedBox(
                  height: 32,
                ),

                Text('Upcoming Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
              child: FutureBuilder(future: UpcomingMovies, 
              builder: (context, snapshot){
                if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }else if(snapshot.hasData){
                 return  MoviesSlider(snapshot: snapshot,);

              }else{
                return const Center(child: CircularProgressIndicator());
              }}) 
            ),
            ],
          ),
        ),
      ),
    );
  }
}

