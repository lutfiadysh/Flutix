part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("Cineplex LIPPO Keboen Raya"),
  Theater("Cineplex Bogor Trade Mall"),
  Theater("XXI Cihampelas Walk"),
  Theater("XXI Bandung Trade Center")
];