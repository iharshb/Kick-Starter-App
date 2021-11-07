const String databaseName = "my.db";
const int databaseVersion = 1;

// ------  Login Table Columns  ---------- //

mixin CartTable {
  static final String tbCartDetails = "tb_cart_details";
  static final String colID = "id";
  static final String colTitle = "title";
  static final String colImage = "image";
  static final String colPrice = "price";
  static final String colColor = "color";
  static final String colSizeSelect = "sizeselect";
}
