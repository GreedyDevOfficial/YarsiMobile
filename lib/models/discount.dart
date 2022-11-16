class Discount {
  final int id;
  final int postId;
  final String discountCode;
  final int discountPercentage;
  final String discountCallbackLink;
  final String postImageUrl;

  Discount({
    required this.id,
    required this.postId,
    required this.discountCode,
    required this.discountPercentage,
    required this.discountCallbackLink,
    required this.postImageUrl
  });
}