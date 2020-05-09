part of "widgets.dart";

class UpComingCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  UpComingCard(this.movie,{this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image:NetworkImage(
                imageBaseURL + "w780" + movie.backdropPath),
            fit: BoxFit.cover),
      ),
    );
  }
}
