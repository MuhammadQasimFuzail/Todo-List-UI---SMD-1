import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos = [];
  TextEditingController inputController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List'),
        actions: [IconButton(onPressed: () {
          todos.add(inputController.text);
          setState(() {
            inputController.text="";
          });
        }, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: todos.length!=0? MainAxisAlignment.start: MainAxisAlignment.end,
          children: [
            todos.length==0? Center(child: Text("Nothing to do")): Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        //dleading: const Icon(Icons.list),
                        trailing:  TextButton(onPressed: (){
                          todos.remove(todos[index]);
                          setState(() {
                            
                          });
                        }, child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),),
                        title: Text(todos[index]));
                  }),
            ),
            TextField(controller: inputController,)
          ],
        ),
      ),
    );
  }
}
