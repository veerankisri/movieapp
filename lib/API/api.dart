import 'dart:convert';

import 'package:flutflix/constants.dart';
import 'package:flutflix/models/movies.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${constants.apiKey}';
  static const _topratedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${constants.apiKey}';
  static const _upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${constants.apiKey}';

  Future<List<Movies>> getTrendingMovies() async{
         final response = await http.get(Uri.parse(_trendingUrl));
         if(response.statusCode == 200){
          final decodedData = json.decode(response.body)['results'] as List;
          return decodedData.map((movie) => Movies.fromJson(movie)).toList();
         }else{
          throw Exception('Something happened');
         }

  }
  Future<List<Movies>> getTopRatedMovies() async{
         final response = await http.get(Uri.parse(_topratedUrl));
         if(response.statusCode == 200){
          final decodedData = json.decode(response.body)['results'] as List;
          return decodedData.map((movie) => Movies.fromJson(movie)).toList();
         }else{
          throw Exception('Something happened');
         }

  }
  Future<List<Movies>> getUpcomingMovies() async{
         final response = await http.get(Uri.parse(_upcomingUrl));
         if(response.statusCode == 200){
          final decodedData = json.decode(response.body)['results'] as List;
          return decodedData.map((movie) => Movies.fromJson(movie)).toList();
         }else{
          throw Exception('Something happened');
         }

  }
}