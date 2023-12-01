import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedStatusIndex = -1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.camera_alt_outlined),
              ),
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
          actions: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            PopupMenuButton(
              icon: const Icon(Icons.more_horiz_outlined),
              itemBuilder: (context) => [
                const PopupMenuItem(value: '1', child: Text('New Group')),
                const PopupMenuItem(value: '2', child: Text('Settings')),
                const PopupMenuItem(value: '3', child: Text('Logout')),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          children: [
            const Text('Camera'),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/WhatsApp Image 2023-07-18 at 11.07.22 AM.jpeg'),
                  ),
                  title: Text(
                    'John Wick',
                    style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
                  ),
                  subtitle: Text(
                    'Loving Husband',
                    style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
                  ),
                  trailing: Text(
                    '3:34 pm',
                    style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
                  ),
                );
              },
            ),


            _buildStatusUI(),

            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/WhatsApp Image 2023-07-18 at 11.07.22 AM.jpeg'),
                  ),
                  title: const Text(
                    'John Wick',
                    style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
                  ),
                  subtitle: Text(
                    index.isEven ? 'You missed audio call' : 'You missed video call',
                    style: const TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
                  ),
                  trailing: Icon(index.isEven ? Icons.call : Icons.video_call),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


Widget _buildStatusUI() {

    if (_selectedStatusIndex == -1) {

      return ListView.builder(

        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(

            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/WhatsApp Image 2023-07-18 at 11.07.22 AM.jpeg'),
            ),

            title: const Text(
              'Ahmad Ziam ',
              style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
            ),
            subtitle: const Text(
              'Today, 2:30 PM',
              style: TextStyle(fontFamily: 'IMFellFrenchCanonSC'),
            ),
            onTap: () {

              setState(() {
                _selectedStatusIndex = index;
              });
            },
          );
        },
      );
    } else {

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/WhatsApp Image 2023-07-18 at 11.07.22 AM.jpeg'), // Replace with your image path
              radius: 100,
            ),
            ElevatedButton(
              onPressed: () {

                setState(() {
                  _selectedStatusIndex = -1;
                });
              },

              child: const Text('Close Status'),
            ),

          ],


        ),

      );
    }
  }
}


