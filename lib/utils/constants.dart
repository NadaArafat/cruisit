import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const kOffWhite = Color(0xFFFAFAFA);
const kAuthPrimaryColor = Color(0xFFFA6C6C);
const kPrimaryColor = Color(0xFFFF7A7E);
const kSecondaryColor = Color(0xFFFF5A5F);
const kThirdColor = Color(0xFFFA4848);
const kFourthColor = Color(0xFFFA6B6B);

const atYourBudget = "At Your Budget";
const visaFreeForYou = "Visa-Free For You";
const mostVisitedCountries = "Most Visited Countries";
const mostPopularCities = "Most Popular Cities";
const unfrequented = "Unfrequented";
const continents = "Continents";

FirebaseFirestore firestore = FirebaseFirestore.instance;

const shimmerGradient = LinearGradient(
  colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
