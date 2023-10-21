class Wacana {
  String? id;
  String? wacanaText;
  bool isDone;

  Wacana({
    required this.id,
    required this.wacanaText,
    this.isDone = false,
  });

  static List<Wacana> wacanaList() {
    return [
      // Wacana(id: '01', wacanaText: 'Web app php project', isDone: true),
      // Wacana(id: '02', wacanaText: 'Web app react js', isDone: true),
      // Wacana(id: '03', wacanaText: 'flutter wacana app',),
      // Wacana(id: '04', wacanaText: 'jaringan komputer task',),
      // Wacana(id: '05', wacanaText: 'intensive english task',),
      // Wacana(id: '06', wacanaText: 'imk group task',),
    ];
  }
}