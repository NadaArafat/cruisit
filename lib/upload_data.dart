import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: SeedFirestore()));
}

class SeedFirestore extends StatelessWidget {
  const SeedFirestore({super.key});

  Future<void> _seedData() async {
    final db = FirebaseFirestore.instance;

    final continents = [
      {
        'id': 1,
        'name': 'Asia',
        'imgUrl':
            'https://images.unsplash.com/photo-1561470842-cedb1cdbeae5', // Tokyo
        'numOfVisits': 1200,
        'startingPrice': 1500,
        'currency': 'JPY',
      },
      {
        'id': 2,
        'name': 'Europe',
        'imgUrl':
            'https://images.unsplash.com/photo-1502602898657-3e91760cbb34', // Paris
      },
      {
        'id': 3,
        'name': 'Africa',
        'imgUrl':
            'https://images.unsplash.com/photo-1573991964011-fd8f6592e3b6', // Morocco
      },
      {
        'id': 4,
        'name': 'North America',
        'imgUrl':
            'https://images.unsplash.com/photo-1533587851505-408e3e96c45b', // New York
      },
      {
        'id': 5,
        'name': 'South America',
        'imgUrl':
            'https://images.unsplash.com/photo-1545243424-0ce743321e11', // Rio
      },
      {
        'id': 6,
        'name': 'Australia',
        'imgUrl':
            'https://images.unsplash.com/photo-1506976785307-8732e854ad89', // Sydney
      },
      {
        'id': 7,
        'name': 'Antarctica',
        'imgUrl':
            'https://images.unsplash.com/photo-1601143648357-551098284f62', // Ice shelf
      },
    ];

    final countries = [
      {
        'id': 1,
        'name': 'Japan',
        'imgUrl':
            'https://images.unsplash.com/photo-1526481280690-4c7b3e56f144',
        'numOfVisits': 1200,
        'startingPrice': 1500,
        'currency': 'JPY',
      },
      {
        'id': 2,
        'name': 'France',
        'imgUrl':
            'https://images.unsplash.com/photo-1508057198894-247b23fe5ade',
        'numOfVisits': 980,
        'startingPrice': 1100,
        'currency': 'EUR',
      },
      {
        'id': 3,
        'name': 'Brazil',
        'imgUrl':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
        'numOfVisits': 860,
        'startingPrice': 900,
        'currency': 'BRL',
      },
      {
        'id': 4,
        'name': 'Canada',
        'imgUrl':
            'https://images.unsplash.com/photo-1500051638674-ff996a0ec29e',
        'numOfVisits': 1100,
        'startingPrice': 1300,
        'currency': 'CAD',
      },
      {
        'id': 5,
        'name': 'Australia',
        'imgUrl':
            'https://images.unsplash.com/photo-1506976785307-8732e854ad89',
        'numOfVisits': 1050,
        'startingPrice': 1250,
        'currency': 'AUD',
      },
    ];

    final batch = db.batch();

    for (final continent in continents) {
      final docRef = db
          .collection('continents')
          .doc(continent['name'].toString());
      batch.set(docRef, continent);
    }

    for (final country in countries) {
      final docRef = db.collection('countries').doc(country['name'].toString());
      batch.set(docRef, country);
    }

    await batch.commit();
    debugPrint('🔥 Firestore seeding complete!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Seeder')),
      body: Center(
        child: ElevatedButton(
          onPressed: _seedData,
          child: const Text('Seed Firestore 🚀'),
        ),
      ),
    );
  }
}
