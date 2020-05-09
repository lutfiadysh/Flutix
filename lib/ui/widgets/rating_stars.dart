part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;

  RatingStars({
    this.voteAverage = 0,
    this.fontSize = 12,
    this.starSize = 20
  });

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

     List<Widget> widgets = List.generate(
         5, (index) => Icon(index < n ? MdiIcons.star : MdiIcons.starOutline,
       color: accentColor2,size: starSize,));

     widgets.add(SizedBox(width:3,));
     widgets.add(Text("$voteAverage/10",
     style: whiteTextFont
         .copyWith(fontWeight: FontWeight.w300,fontSize: fontSize),));

    return Row(
        children: widgets,
    );
  }
}
