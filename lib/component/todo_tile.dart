import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;

   TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
     required this.deleteFunction
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: widget.deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Colors.red.shade300,
              )
            ]
        ),
        child: Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Checkbox(
                      value: widget.taskCompleted,
                      onChanged: widget.onChanged,
                      activeColor: Colors.black54,
                  ),
                  Text(
                      widget.taskName,
                      style: TextStyle(
                        decoration: widget.taskCompleted? TextDecoration.lineThrough : TextDecoration.none
                      ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius:  BorderRadius.circular(12),
              ),
        
        ),
      ),
    );
  }
}
