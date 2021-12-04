import 'package:flutter/material.dart';
import 'package:telesmile/src/view/widgets/appbar.dart';

import 'action_on_topic.dart';
import 'drawerpage/drawer.dart';

class Topics extends StatelessWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              const Text(
                'Oral for Blind',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Cras pulvinar pellentesque in',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                '.لكل نع مغرلاب ةنيدم يسرك ,دقو نويدلاو ريوطت مت فلاو الا لك .ندم يف ملاعلا ةيملاع ,مت يفو راصتقاو طيحملا',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3, color: const Color(0xFFFCB117))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  const ActionsonTopic()));
                  },
                  leading: Image.asset(
                    'assets/blind men.png',
                    fit: BoxFit.fill,
                  ),
                  title: const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox( height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3, color: const Color(0xFFFCB117))),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  const ActionsonTopic()));
                  },
                  leading: Image.asset(
                    'assets/blind men.png',
                    fit: BoxFit.fill,
                  ),
                  title: const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3, color: const Color(0xFFFCB117))),
                child: ListTile(
                  leading: Image.asset(
                    'assets/blind men.png',
                    fit: BoxFit.fill,
                  ),
                  title: const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}