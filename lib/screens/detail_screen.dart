import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:movieflix/models/movieInfo.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String backdrop_path;

  const DetailScreen({
    Key? key,
    required this.id,
    required this.backdrop_path,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieInfo> movieInfo;

  @override
  void initState() {
    super.initState();
    movieInfo = ApiService.getMovieInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Back to list',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500/${widget.backdrop_path}',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          FutureBuilder(
            future: movieInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 200,
                    left: 10,
                    right: 10,
                    bottom: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ratingStar(snapshot.data!.vote_average),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Text(
                            '${formatTime(snapshot.data!.runtime)} | ',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          for (var genre in snapshot.data!.genres)
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                genre['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Storyline',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              snapshot.data!.overview,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      snapshot.data!.homepage.isNotEmpty
                          ? buyTicketButton(snapshot.data!.homepage, context)
                          : Container(),
                    ],
                  ),
                );
              }
              return const Text(
                '...',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }

  // 버튼
  Widget buyTicketButton(String homepageUrl, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () {
          // http, https 링크는 가능
          // intent로 넷플릭스 가는 부분 수정필요
          if (homepageUrl.contains('https://www.netflix.com')) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('넷플릭스 앱으로 이동'),
              ),
            );
          } else {
            launchUrlString(homepageUrl);
          }
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 215, 73, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text('Buy ticket',
                style: TextStyle(
                    color: Color.fromRGBO(35, 35, 35, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }

  // 별점
  Widget ratingStar(double voteAverage) {
    return RatingStars(
      value: voteAverage,
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
      ),
      starCount: 5,
      starSize: 20,
      maxValue: 10,
      starSpacing: 2,
      maxValueVisibility: true,
      valueLabelVisibility: false,
      valueLabelPadding: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 8,
      ),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: Colors.grey.withOpacity(0.6),
      starColor: const Color.fromRGBO(248, 216, 73, 1),
    );
  }

  // 런타임 포멧
  String formatTime(int runtime) {
    var time = Duration(minutes: runtime);

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    int hours = time.inHours;
    String minutes = twoDigits(time.inMinutes.remainder(60));
    return '${hours}h ${minutes}min';
  }
}
