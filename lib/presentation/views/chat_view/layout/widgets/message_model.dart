class MessageModel {
  final String text;
  final DateTime date;
  final String senderImagePath;
  final String receiverImagePath;
  final bool isSentByMe;

  MessageModel({
    required this.text,
    required this.date,
    required this.isSentByMe,
    required this.senderImagePath,
    required this.receiverImagePath,
  });
}
