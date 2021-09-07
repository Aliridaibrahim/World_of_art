

class ProductModel{


  // static const ID = "id";
  // static const NAME = "name";
  // static const PICTURE = "picture";
  // static const PRICE = "price";
  // static const DESCRIPTION = "description";
  // static const CATEGORY = "category";
  // static const FEATURED = "featured";
  // static const QUANTITY = "quantity";


  String _id;
  String _name;
  String _picture;
  String _description;
  String _category;
  int _quantity;
  int _price;
  bool _featured;

  // String get id => _id;
  //
  // String get name => _name;
  //
  // String get picture => _picture;
  //
  //
  // String get category => _category;
  //
  // String get description => _description;
  //
  // int get quantity => _quantity;
  //
  // int get price => _price;
  //
  // bool get featured => _featured;

  ProductModel.fromMap(Map<String, dynamic> data) {
    _id = data['_id'];
    _name = data['_name'];
    _picture = data['_picture'];
    _category = data['_category'];
    _quantity = data['_quantity'];
    _price = data['_price'];
    _featured = data['_featured'];
    _description = data['_description'];




  }
  Map<String, dynamic> toMap() {
    return {
      '_id': _id,
      '_name': _name,
      '_picture': _picture,
      '_category': _category,
      '_quantity': _quantity,
      '_price': _price,
      '_featured': _featured,
      '_description': _description,
    };
  }

}