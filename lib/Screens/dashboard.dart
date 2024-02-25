import 'package:flutter/material.dart';
import 'package:libroloom/Screens/components/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/cardGenerator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    //getSnapshot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(title: const Text('LibroLoom'),),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('books').snapshots(),
            builder: (context, snapshot){
              List <Widget> clientRows = [];
              if(snapshot.hasData){
                final books = snapshot.data?.docs.toList();
                for(var book in books!){
                  final clientWidget = CardGenerator(url: book['URL'], name: book['Name']);
                  clientRows.add(clientWidget);
                }
              }
              return ListView(
                children: clientRows,
              );
            }
        ),
      ),
    );
  }

  // void getSnapshot() async {
  //   final db = FirebaseFirestore.instance;
  //   final allDocs = db.collection('books').doc().snapshots();
  //   var docId = allDocs.docs;
  // }
}
