import 'package:flutter/material.dart';
import 'data.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  final List<Map<String, String>> produk = [
    {
      "title": "Burger King Medium",
      "description": "Deskripsi singkat untuk Burger King Medium.",
      "image": "assets/burger1.png",
      "price": "Rp.50.000,00",
    },
    {
      "title": "Teh Botol",
      "description": "Deskripsi singkat untuk Teh Botol.",
      "image": "assets/sosro.png",
      "price": "Rp.4.000,00",
    },
    {
      "title": "Burger King Small",
      "description": "Deskripsi singkat untuk Burger King Small.",
      "image": "assets/burger1.png",
      "price": "Rp.35.000,00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonWidget(),
                SizedBox(width: 20),
                PersonIconWidget(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const AddDataButton(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text('Foto', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Nama Produk', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Harga', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, indent: 20, endIndent: 20),
          Expanded(
            child: ListView.builder(
              itemCount: produk.length,
              itemBuilder: (context, index) {
                final item = produk[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item["image"]!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(child: Text(item["title"]!)),
                          ),
                          Expanded(
                            child: Center(child: Text(item["price"]!)),
                          ),
                          Expanded(
                            child: Center(
                              child: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1, indent: 10, endIndent: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class PersonIconWidget extends StatelessWidget {
  const PersonIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: IconButton(
        icon: const Icon(Icons.person, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}

class AddDataButton extends StatelessWidget {
  const AddDataButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DataPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 3, 14, 211),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), 
        ),
        child: const Text(
          'Add Data +',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

