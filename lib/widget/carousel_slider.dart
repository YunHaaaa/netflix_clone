import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model.movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage({required this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  // state로 관리해 줄 변수 선언
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  // CarouselImages에서 어느 위치에 있는지 index를 저장
  late int _currentPage = 0;

  // 그 페이지에 기록되어있는 현재 키워드
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
              items: images,
              // 페이지 전환
              // onPageChanged: (index) {
              //   setState(() {
              //     _currentPage = index;
              //     _currentKeyword = keywords[_currentPage];
              //   });
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(
                    () {
                      _currentPage = index;
                      _currentKeyword = keywords![_currentPage];
                      },
                    );
                  },
              ),
          ),
          Container(
            child: Text(_currentKeyword),
          ),
        ],
      ),
    );
  }
}