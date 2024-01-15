import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_notes_button_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[400],
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            context: context,
            builder: (context) {
              return const AddNotesButtonSheet();
            },
          );
        },
        child: const Icon(Icons.add, size: 24),
      ),
      body: const NotesViewBody(),
    );
  }
}
