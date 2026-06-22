import '../../domain/entities/category.dart';
import '../../domain/entities/delivery_location.dart';
import '../../domain/entities/product.dart';

class MockData {
  MockData._();

  static const List<Category> categories = [
    Category(id: 'cat_1', name: 'Électronique', iconName: 'devices'),
    Category(id: 'cat_2', name: 'Vêtements', iconName: 'checkroom'),
    Category(id: 'cat_3', name: 'Alimentation', iconName: 'restaurant'),
    Category(id: 'cat_4', name: 'Maison', iconName: 'home'),
    Category(id: 'cat_5', name: 'Sport', iconName: 'sports_soccer'),
    Category(id: 'cat_6', name: 'Beauté', iconName: 'spa'),
  ];

  static const List<Product> products = [
    // Électronique
    Product(
      id: 'p1',
      name: 'Smartphone Pro X12',
      description:
          'Smartphone dernière génération avec écran AMOLED 6.7", processeur octa-core, 128 Go de stockage et triple caméra 108 MP.',
      price: 699.99,
      originalPrice: 899.99,
      features: ['Écran AMOLED 6.7" Full HD+', 'Triple caméra 108 MP'],
      imageUrl: 'https://picsum.photos/seed/phone1/400/400',
      stock: 15,
      categoryId: 'cat_1',
      rating: 4.5,
      reviewCount: 128,
    ),
    Product(
      id: 'p2',
      name: 'Écouteurs Sans Fil Elite Pro',
      description:
          'Écouteurs Bluetooth 5.3 avec réduction de bruit active, autonomie 30h et charge rapide.',
      price: 99.99,
      originalPrice: 149.99,
      features: ['Réduction de bruit active', 'Autonomie 30 heures'],
      imageUrl: 'https://picsum.photos/seed/headphones1/400/400',
      stock: 3,
      categoryId: 'cat_1',
      rating: 4.9,
      reviewCount: 264,
    ),
    Product(
      id: 'p3',
      name: 'Tablette Ultra Tab 10',
      description:
          'Tablette 10.1" Full HD, 64 Go, Wi-Fi 6, batterie 7000 mAh. Idéale pour le travail et les loisirs.',
      price: 249.99,
      originalPrice: 349.99,
      features: ['Écran 10.1" Full HD', 'Batterie 7000 mAh'],
      imageUrl: 'https://picsum.photos/seed/tablet1/400/400',
      stock: 8,
      categoryId: 'cat_1',
      rating: 4.9,
      reviewCount: 243,
    ),
    Product(
      id: 'p4',
      name: 'Batterie Externe 20000 mAh',
      description:
          'Power bank 20000 mAh charge rapide 18W, 2 ports USB + USB-C, compatible tous appareils.',
      price: 24.99,
      originalPrice: 39.99,
      features: ['Type-C (ENTRÉE/SORTIE)', 'Chargez plusieurs appareils'],
      imageUrl: 'https://picsum.photos/seed/powerbank1/400/400',
      stock: 20,
      categoryId: 'cat_1',
      rating: 4.9,
      reviewCount: 243,
    ),
    // Vêtements
    Product(
      id: 'p5',
      name: 'Veste en Cuir Premium',
      description:
          'Veste en cuir véritable, coupe slim, disponible en noir et marron. Tailles S à XXL.',
      price: 129.99,
      originalPrice: 199.99,
      features: ['Cuir véritable premium', 'Coupe slim moderne'],
      imageUrl: 'https://picsum.photos/seed/jacket1/400/400',
      stock: 12,
      categoryId: 'cat_2',
      rating: 4.7,
      reviewCount: 43,
    ),
    Product(
      id: 'p6',
      name: 'Jean Slim Fit Classic',
      description:
          'Jean stretch slim fit, 98% coton 2% élasthanne, disponible en bleu, noir et gris.',
      price: 39.99,
      originalPrice: 59.99,
      features: ['98% Coton, 2% Élasthanne', 'Disponible en 3 coloris'],
      imageUrl: 'https://picsum.photos/seed/jeans1/400/400',
      stock: 25,
      categoryId: 'cat_2',
      rating: 4.2,
      reviewCount: 97,
    ),
    Product(
      id: 'p7',
      name: 'Sneakers Urban Style',
      description:
          'Baskets tendance avec semelle EVA confort, tige en mesh respirant. Du 36 au 47.',
      price: 59.99,
      originalPrice: 89.99,
      features: ['Semelle EVA ultra-confort', 'Mesh respirant'],
      imageUrl: 'https://picsum.photos/seed/shoes1/400/400',
      stock: 0,
      categoryId: 'cat_2',
      rating: 4.4,
      reviewCount: 112,
    ),
    // Alimentation
    Product(
      id: 'p8',
      name: 'Café Arabica Bio 500g',
      description:
          'Café arabica 100% biologique torréfié artisanalement. Arômes de noisette et chocolat.',
      price: 11.99,
      originalPrice: 14.99,
      features: ['100% Arabica biologique', 'Torréfaction artisanale'],
      imageUrl: 'https://picsum.photos/seed/coffee1/400/400',
      stock: 50,
      categoryId: 'cat_3',
      rating: 4.8,
      reviewCount: 203,
    ),
    Product(
      id: 'p9',
      name: 'Huile d\'Olive Extra Vierge',
      description:
          'Huile d\'olive première pression à froid, AOP Provence, bouteille 750 ml.',
      price: 9.99,
      originalPrice: 12.50,
      features: ['Première pression à froid', 'AOP Provence certifiée'],
      imageUrl: 'https://picsum.photos/seed/olive1/400/400',
      stock: 30,
      categoryId: 'cat_3',
      rating: 4.6,
      reviewCount: 78,
    ),
    // Maison
    Product(
      id: 'p10',
      name: 'Lampe de Bureau LED',
      description:
          'Lampe LED avec bras articulé, 5 modes d\'éclairage, port USB de charge intégré.',
      price: 34.99,
      originalPrice: 49.99,
      features: ['5 modes d\'éclairage', 'Port USB de charge intégré'],
      imageUrl: 'https://picsum.photos/seed/lamp1/400/400',
      stock: 4,
      categoryId: 'cat_4',
      rating: 4.3,
      reviewCount: 67,
    ),
    Product(
      id: 'p11',
      name: 'Canapé Convertible 3 Places',
      description:
          'Canapé lit en tissu microfibre, couchage 140x190 cm, coffre de rangement intégré.',
      price: 449.99,
      originalPrice: 599.99,
      features: ['Couchage 140×190 cm', 'Coffre de rangement intégré'],
      imageUrl: 'https://picsum.photos/seed/sofa1/400/400',
      stock: 2,
      categoryId: 'cat_4',
      rating: 4.0,
      reviewCount: 31,
    ),
    // Sport
    Product(
      id: 'p12',
      name: 'Montre Connectée Sport IP68',
      description:
          'Smartwatch avec suivi GPS, fréquence cardiaque, résistante à l\'eau IP68. Autonomie 7 jours.',
      price: 89.99,
      originalPrice: 129.99,
      features: ['Cadrans de Montre Génériques', 'Autonomie de Batterie 7j'],
      imageUrl: 'https://picsum.photos/seed/watch1/400/400',
      stock: 5,
      categoryId: 'cat_5',
      rating: 4.8,
      reviewCount: 244,
    ),
    Product(
      id: 'p13',
      name: 'Tapis de Yoga Premium',
      description:
          'Tapis antidérapant 183x61cm, épaisseur 6mm, avec sangle de transport. Matière TPE.',
      price: 24.99,
      originalPrice: 34.99,
      features: ['Antidérapant épaisseur 6mm', 'Sangle de transport incluse'],
      imageUrl: 'https://picsum.photos/seed/yoga1/400/400',
      stock: 20,
      categoryId: 'cat_5',
      rating: 4.5,
      reviewCount: 89,
    ),
    // Beauté
    Product(
      id: 'p14',
      name: 'Sérum Vitamine C 30ml',
      description:
          'Sérum concentré à 15% de vitamine C pure, anti-âge et éclat du teint. Convient à tous types de peau.',
      price: 27.99,
      originalPrice: 39.99,
      features: ['15% Vitamine C pure', 'Anti-âge & éclat du teint'],
      imageUrl: 'https://picsum.photos/seed/serum1/400/400',
      stock: 18,
      categoryId: 'cat_6',
      rating: 4.6,
      reviewCount: 145,
    ),
    Product(
      id: 'p15',
      name: 'Fer à Repasser Compact 1740W',
      description:
          'Fer à repasser vapeur 1740W, semelle céramique, 6 niveaux de vapeur, poignée pliable 180°.',
      price: 34.99,
      originalPrice: 54.99,
      features: ['6 Niveaux de Vapeur', 'Poignée Pliable à 180°'],
      imageUrl: 'https://picsum.photos/seed/iron1/400/400',
      stock: 7,
      categoryId: 'cat_4',
      rating: 4.9,
      reviewCount: 2100,
    ),
  ];

  static const List<DeliveryLocation> deliveryLocations = [
    DeliveryLocation(
      id: 'dl_1',
      name: 'Livraison Standard',
      address: 'À votre domicile',
      city: 'Partout en France',
      deliveryFee: 4.99,
      estimatedTime: '3-5 jours ouvrés',
    ),
    DeliveryLocation(
      id: 'dl_2',
      name: 'Livraison Express',
      address: 'À votre domicile',
      city: 'Partout en France',
      deliveryFee: 9.99,
      estimatedTime: '24-48h',
    ),
    //fd
    DeliveryLocation(
      id: 'dl_3',
      name: 'Point Relais',
      address: '12 Rue de la Paix',
      city: 'Paris 75001',
      deliveryFee: 2.99,
      estimatedTime: '3-5 jours ouvrés',
    ),
    DeliveryLocation(
      id: 'dl_4',
      name: 'Retrait en Magasin',
      address: '45 Avenue des Champs-Élysées',
      city: 'Paris 75008',
      deliveryFee: 0.00,
      estimatedTime: 'Disponible sous 2h',
    ),
    DeliveryLocation(
      id: 'dl_5',
      name: 'Livraison Le Lendemain',
      address: 'À votre domicile',
      city: 'Île-de-France uniquement',
      deliveryFee: 14.99,
      estimatedTime: 'Demain avant 13h',
    ),
  ];
}
