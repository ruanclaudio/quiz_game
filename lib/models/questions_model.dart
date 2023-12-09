class Question {
  final String id;
  // id para identificar a questão
  final String title;
  // titulo da questão
  final Map<String, bool> options;
  // Toda questão terá a opção correta e errada
  // options => {'0': false, '1': true}

  // Construtor
  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(ID: $id, Título: $title, Opção: $options)';
  }
}
