class Food {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double rating;
  final String description;
  double quantity;

  Food({
    this.rating,
    this.id,
    this.name,
    this.imagePath,
    this.category,
    this.price,
    this.discount,
    this.description,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
