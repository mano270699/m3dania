class CartModel {
  bool? success;
  Data? data;
  String? message;

  CartModel({this.success, this.data, this.message});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = '${json['message']}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Items>? items;
  int? itemsCount;
  double? total;

  Data({this.items, this.itemsCount, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    itemsCount = json['items_count'];
    total = json['total'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['items_count'] = this.itemsCount;
    data['total'] = this.total;
    return data;
  }
}

class Items {
  int? id;
  int? cartId;
  String? buyableType;
  int? buyableId;
  int? quantity;
  List<dynamic>? options;
  String? createdAt;
  String? updatedAt;
  Buyable? buyable;

  Items(
      {this.id,
      this.cartId,
      this.buyableType,
      this.buyableId,
      this.quantity,
      this.options,
      this.createdAt,
      this.updatedAt,
      this.buyable});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    buyableType = json['buyable_type'];
    buyableId = json['buyable_id'];
    quantity = json['quantity'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options!.add(v);
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buyable =
        json['buyable'] != null ? new Buyable.fromJson(json['buyable']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['buyable_type'] = this.buyableType;
    data['buyable_id'] = this.buyableId;
    data['quantity'] = this.quantity;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.buyable != null) {
      data['buyable'] = this.buyable!.toJson();
    }
    return data;
  }
}

class Buyable {
  int? id;
  String? name;
  String? description;
  String? price;
  int? minQty;
  String? photo;
  bool? isActive;
  int? regionId;
  String? createdAt;
  String? updatedAt;

  Buyable(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.minQty,
      this.photo,
      this.isActive,
      this.regionId,
      this.createdAt,
      this.updatedAt});

  Buyable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    minQty = json['min_qty'];
    photo = json['photo'];
    isActive = json['is_active'];
    regionId = json['region_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['min_qty'] = this.minQty;
    data['photo'] = this.photo;
    data['is_active'] = this.isActive;
    data['region_id'] = this.regionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
