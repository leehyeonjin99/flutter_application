import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Todo{
  bool isDone = false;
  String title;

  Todo(this.title, {this.isDone = false});
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  var _todoController = TextEditingController();

  @override
  void dispose(){
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일')
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child: Text('추가'),
                  onPressed: () => _addTodo(Todo(_todoController.text))
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('todo').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                final documents = snapshot.data!.docs;
                return Expanded(
                  child: ListView(
                    children: documents.map((doc) => _buildItemWidget(doc)).toList(),
                    itemExtent: 45.0,
                  ),
                );
              }
            )
          ],
        ),
      )
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc){
    final todo = Todo(doc['title'], isDone: doc['isDone']);

    return ListTile(
      onTap: () => _toggleTodo(doc),
      title: Text(
        todo.title,
        style: todo.isDone? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic
        )
        : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(doc),
      ),
    );
  }

  void _addTodo(Todo todo){
    FirebaseFirestore.instance.collection('todo').add({'title': todo.title, 'isDone': todo.isDone});
    _todoController.text = '';
  }

  void _deleteTodo(DocumentSnapshot docs){
    FirebaseFirestore.instance.collection('todo').doc(docs.id).delete();
  }

  void _toggleTodo(DocumentSnapshot docs){
    FirebaseFirestore.instance.collection('todo').doc(docs.id).update({'isDone': !docs['isDone']});
  }
}
