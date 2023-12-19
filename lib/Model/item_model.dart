class ItemsModel {
  String? bestSeller;
  String? dealOfTheDay;
  String? name;
  String? image;
  String? offer;
  String? price;
  int? quantity;

  ItemsModel(
      {this.bestSeller,
        this.dealOfTheDay,
        this.name,
        this.image,
        this.offer,
        this.price,
        this.quantity});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    bestSeller = json['bestSeller'];
    dealOfTheDay = json['dealOfTheDay'];
    name = json['name'];
    image = json['image'];
    offer = json['offer'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bestSeller'] = this.bestSeller;
    data['dealOfTheDay'] = this.dealOfTheDay;
    data['name'] = this.name;
    data['image'] = this.image;
    data['offer'] = this.offer;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
