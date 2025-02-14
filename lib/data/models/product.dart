class ProductModel {
  String? sId;
  String? deviceCondition;
  String? listedBy;
  String? deviceStorage;
  List<Images>? images;
  String? listingState;
  String? listingLocation;
  String? listingPrice;
  String? make;
  String? marketingName;
  bool? openForNegotiation;

  ProductModel(
      {this.sId,
        this.deviceCondition,
        this.listedBy,
        this.deviceStorage,
        this.images,
        this.listingState,
        this.listingLocation,
        this.listingPrice,
        this.make,
        this.marketingName,
        this.openForNegotiation});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deviceCondition = json['deviceCondition'];
    listedBy = json['listedBy'];
    deviceStorage = json['deviceStorage'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    listingState = json['listingState'];
    listingLocation = json['listingLocation'];
    listingPrice = json['listingPrice'];
    make = json['make'];
    marketingName = json['marketingName'];
    openForNegotiation = json['openForNegotiation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['deviceCondition'] = this.deviceCondition;
    data['listedBy'] = this.listedBy;
    data['deviceStorage'] = this.deviceStorage;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['listingState'] = this.listingState;
    data['listingLocation'] = this.listingLocation;
    data['listingPrice'] = this.listingPrice;
    data['make'] = this.make;
    data['marketingName'] = this.marketingName;
    data['openForNegotiation'] = this.openForNegotiation;
    return data;
  }
}

class Images {
  String? thumbImage;
  String? fullImage;
  String? isVarified;
  String? sId;

  Images({this.thumbImage, this.fullImage, this.isVarified, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    thumbImage = json['thumbImage'];
    fullImage = json['fullImage'];
    isVarified = json['isVarified'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbImage'] = this.thumbImage;
    data['fullImage'] = this.fullImage;
    data['isVarified'] = this.isVarified;
    data['_id'] = this.sId;
    return data;
  }
}