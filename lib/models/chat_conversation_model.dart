class Conversation {
  final int id;
  final String conversationName;
  final String conversationText;
  final String profileImageUrl;
  final String date;
  final String time;
  final String senderType;

  Conversation({
    required this.id,
    required this.conversationName,
    required this.conversationText,
    required this.profileImageUrl,
    required this.date,
    required this.time,
    required this.senderType
  });
}
