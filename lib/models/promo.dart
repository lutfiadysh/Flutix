part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
        {
          @required this.title,@required this.subtitle,@required this.discount
        }
      );

  @override
  List<Object> get props => [title,subtitle,discount];

}

 List<Promo> dummyPromos = [
   Promo(title: "student Holiday!", subtitle: "Maximal for senior high school student", discount: 70),
   Promo(title: "Mothers Day", subtitle: "Only for kids and mother", discount: 30),
   Promo(title: "Corona virus", subtitle: "Only for people who infected corona", discount: 50)
 ];