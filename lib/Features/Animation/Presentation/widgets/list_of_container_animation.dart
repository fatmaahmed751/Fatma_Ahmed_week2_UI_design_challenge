import 'package:flutter/material.dart';
import 'container_of_animation.dart';

class AnimationList extends StatefulWidget {
  const AnimationList({super.key});

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  List<String> items = ["Review Clean Architecture",
    "Complete Flutter Assignment", "Practice Widget Catalog"];
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: ValueKey(item),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("confirm delete"),
                content: Text("Are you sure to delete $item ?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("cancel"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("delete", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) {
            final removedItem = item;
            final removedIndex = index;
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$removedItem confirm delete"),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    setState(() {
                      items.insert(removedIndex, removedItem);
                    });
                  },
                ),
              ),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: AnimationContainerOfList(text: item,
            key:ValueKey(index) ,
            index: index,),
        );
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex -= 1;
          final element = items.removeAt(oldIndex);
          items.insert(newIndex, element);
        });
      },
      itemCount: items.length,
    );
  }
}
