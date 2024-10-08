import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Feedbacks').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(snapshot.data.docs[index]['username']),
                  subtitle: Text(
                      snapshot.data.docs[index]['message']),
                  // trailing: Text(snapshot.data.docs[index]['created_at'].toString()),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30,
        color: const Color.fromARGB(255, 242, 238, 238),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      var message = await FirestoreService()
                          .postFeedback(messageController.text);

                      messageController.clear();
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Icon(Icons.send),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// ListView.separated(
//         separatorBuilder: (context, index) => Divider(),
//         itemCount: 20,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: CircleAvatar(),
//             title: Text('Nome'),
//             subtitle: Text(
//                 'Comentariooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'),
//             trailing: Text('02/10/24'),
//           );
//         },
//       ),