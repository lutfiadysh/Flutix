part of 'models.dart';

class MovieTransaction extends Equatable {
  final String userID;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime date;
  final String picture;

  MovieTransaction(
        {
          @required this.userID,
          @required this.title,
          @required this.subtitle,
          @required this.amount,
          @required this.date,
          @required this.picture
        }
      );
  @override
  List<Object> get props => [userID,title,subtitle,amount,date,picture];

}