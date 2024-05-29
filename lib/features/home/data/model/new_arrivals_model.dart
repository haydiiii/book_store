class NewArrivalsModel {
  Data? data;
  String? message;
  List<Null>? error;
  int? status;

  NewArrivalsModel({this.data, this.message, this.error, this.status});

  NewArrivalsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = <Null>[];
      json['error'].forEach((v) {
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<Preoductss>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Preoductss>[];
      json['products'].forEach((v) {
        products!.add( Preoductss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Preoductss {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  Preoductss(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.stock,
      this.bestSeller,
      this.image,
      this.category});

  Preoductss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    stock = json['stock'];
    bestSeller = json['best_seller'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['stock'] = this.stock;
    data['best_seller'] = this.bestSeller;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }
}
