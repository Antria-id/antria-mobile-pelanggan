class APIUrl {
  static String get baseUrl => 'https://development.verni.yt';
  static String get loginUserPath => '/auth/login/pelanggan';
  static String get registerUserPath => '/pelanggan';
  static String get getRestaurantPath => '/mitra';
  static String getPelangganPath(int id) => '/pelanggan/$id';
  static String getInfoRestaurantPath(int mitraId) => '/mitra/$mitraId';
  static String getMenuRestaurantPath(int mitraId) => '/produk/mitra/$mitraId';
}
