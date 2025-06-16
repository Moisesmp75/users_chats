
enum FromWho {
  me,
  hers
}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    text: json['answer'] == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.hers,
    imageUrl: json['image']
  );
}