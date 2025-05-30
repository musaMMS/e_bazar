import 'package:flutter/material.dart';


// Editable text variables

const String sectionPersonal = "Personal";
const String textProfile = "Profile";
const String textShipping = "Shipping Address";
const String textPayment = "Payment methods";

const String sectionShop = "Shop";
const String textCountry = "Country";
const String textCurrency = "Currency";
const String textSizes = "Sizes";
const String textTerms = "Terms and Conditions";

const String sectionAccount = "Account";
const String textLanguage = "Language";
const String textAbout = "About Slada";

const String textDelete = "Log Out";
const String footerSlada = "MM\nVersion 1.0 April, 2020";

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 30),
            buildSectionHeader(sectionPersonal),
            buildListTile(textProfile),
            buildListTile(textShipping),
            buildListTile(textPayment),
            const SizedBox(height: 20),
            buildSectionHeader(sectionShop),
            buildListTileWithTrailing(textCountry, "Vietnam"),
            buildListTileWithTrailing(textCurrency, "\$ USD"),
            buildListTileWithTrailing(textSizes, "UK"),
            buildListTile(textTerms),
            const SizedBox(height: 20),
            buildSectionHeader(sectionAccount),
            buildListTileWithTrailing(textLanguage, "English"),
            buildListTile(textAbout),
            const SizedBox(height: 20),
            Center(
              child: Text(
                textDelete,
                style: const TextStyle( fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                footerSlada,
                style: const TextStyle( fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget buildListTile(String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }

  Widget buildListTileWithTrailing(String title, String trailingText) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(trailingText, style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }
}
