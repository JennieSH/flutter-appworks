import 'package:json_annotation/json_annotation.dart';

part 'campaign.g.dart';

@JsonSerializable()
class Campaign {
  Campaign({
    required this.id,
    required this.productId,
    required this.picture,
    required this.story,
  });

  int id;
  @JsonKey(name: 'product_id')
  int productId;
  String picture;
  String story;

  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignToJson(this);

  @override
  String toString() {
    return 'Campaign{productId: $productId, picture: $picture}';
  }
}
