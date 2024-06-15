num convertToIntIfPossible(double value) {
  // Memeriksa apakah value adalah integer
  if (value == value.floor()) {
    return value.toInt(); // Konversi ke integer
  } else {
    return value; // Biarkan tetap dalam bentuk double
  }
}
