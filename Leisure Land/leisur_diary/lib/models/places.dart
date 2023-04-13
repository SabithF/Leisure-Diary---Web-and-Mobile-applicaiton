class Places {
  String image;
  String title;
  String location;
  String info;
  int price;
  Places({
    required this.image,
    required this.title,
    required this.location,
    required this.info,
    required this.price,
  });
}

List<Places> places = [
  Places(
    image: 'assets/places/p1.png',
    title: 'Fakistra',
    location: 'Fakistra Greece',
    info:
        'Fakistra Beach Pelion: Fakistra is a lovely turquoise bay with soft sand and some rocky spots. This wonderful place is surrounded by huge cliffs with dense vegetation and boasts an exotic and quite wild scenery. An interesting fact is that some scenes from the Hollywood movie Mamma Mia! were filmed here back in 2008.',
    price: 350,
  ),
  Places(
    image: 'assets/places/p2.png',
    title: 'Agios',
    location: 'Agios Ioannis',
    info:
        'Agios Ioannis Beach Pelion: Agios Ioannis is an extremely beautiful sandy beach on the northern side of Pelion, 52 km east of Volos. Trees and fabulous waters combining together are forming a landscape of dreams, giving to the place a magical tone. Because of its unique beauty and an international publicity, this beach attracts every summer thousands of visitors inundating it and the many hotels on the seashore. A part of this long beach consists of abrupt rocks.',
    price: 320,
  ),
  Places(
    image: 'assets/places/p3.png',
    title: 'Mylopotamos',
    location: 'Paralia Milopotamos,',
    info:
        'Mylopotamos Beach Pelion: Milopotamos is a white pebbled beach, with exotic crystal water of unique beauty. It is divided by rocks into two sections with a snaky path leading from one part to another. Pine trees are shadowing the path leading to this beautiful beach. Above the beach there is a beach bar and few lovely taverns. The road to Mylopotamos passes through the village of Tsagarada, eastern Pelion.',
    price: 450,
  ),
  Places(
    image: 'assets/places/p4.png',
    title: 'Katigiorgis',
    location: 'Pelion Katigiorgis',
    info:
        'Katigiorgis Pelion, Greece: Katigiorgis is a small fishing place on the southern side of Pelion. Surrounded by lush greenery and low hills, Katigiorgis has delicious fish taverns and few accommodations. The beach is small but clean and gives nice view to the Aegean Sea. In a close distance from Katigiorgis, there is a horse farm that offers nice horse rides in the beautiful nature. This small beach settlement is located 68 km south east of Volos and about 10 km from Platanias. Other beaches close to Katigiorgis are Theotokos, Lyri, Vromoneri and Mourtias.',
    price: 500,
  ),
];
