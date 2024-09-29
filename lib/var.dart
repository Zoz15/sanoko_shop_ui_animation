import 'package:flutter/material.dart';

List<String> images = [
  'assets/images/products/4.png',
  'assets/images/products/2.png',
  'assets/images/products/1.png',
  'assets/images/products/3.png',
  'assets/images/products/5.png',
  'assets/images/products/6.png',
  'assets/images/products/7.png',
];
List<String> descriptions = [
  "A high-back leather chair with adjustable lumbar support, height adjustment, and padded armrests. The premium leather and modern design make it a standout piece in any office.",
  "A plush armchair with a deep seat, soft fabric, and tufted backrest. Ideal for creating a comfortable reading nook or adding elegance to any living room.",
  //"A sleek dining chair with clean lines and neutral colors. The upholstered seat and tapered legs create a contemporary look, perfect for modern dining spaces.",
  "A weather-resistant outdoor lounge chair with a sleek design and comfortable cushions. Perfect for relaxing outside, offering both style and durability.",
  "A high-back gaming chair with adjustable armrests and lumbar support. Its racing design and vibrant colors make it a striking piece for any gaming setup.",
  "A colorful accent chair available in vibrant hues and unique shapes. Great for adding personality and flair to any room as a focal point.",
  "A foldable chair with a sturdy frame and comfortable seat. Ideal for small spaces or guest rooms, folding neatly when not in use.",
  "An industrial-style chair with a metal frame and upholstered seat. The mix of materials creates a rustic yet modern aesthetic, perfect for contemporary interiors.",
  "A bohemian armchair with a woven fabric seat and natural wood frame. Its organic design adds a cozy, relaxed vibe, ideal for bohemian-inspired spaces."
];

List<String> titel = [
  'Comfort Corner Chair',
  'Modern Minimalist Seat',
  'Classic Cozy Cushion',
  'Everyday Essential Chair',
  'Ergonomic Office Option',
  'Stylish Seating Solution',
  'Premium Quality Perch',
  'Relaxing Retreat Rocker',
  'Backrest Bliss Chair',
  'Stylish Seating Sanctuary',
];

List<String> prices = [
  '100',
  '200',
  '300',
  '400',
  '500',
  '600',
  '700',
];
List<String> names = [
  'Hanes',
  'Fruit of the Loom',
  'Champion',
  'Uniqlo',
  'Everlane',
  'Reigning Champ',
  'Nike',
  'Adidas',
  'Ralph Lauren',
  'Tommy Hilfiger',
  'American Apparel',
  'Alternative',
];

late double height;
late double width;
double paddingInHomeScreen = 30;
bool isPressed = false;

Color darkGreen = const Color(0xff5b8179);
Color lightGreen = const Color(0xffc4dbd2);
Color darkOrange = const Color(0xffd39669);
Color lightOrange = const Color(0xffebe5d8);
Color yellow = const Color(0xffebd9bb);
Color offWhite = const Color(0xffF3EEEA);
