import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

import 'edit_note_color_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context)
                    .fetchAllNotes(); //Refresh notes
                Navigator.pop(context);
                Fluttertoast.showToast(
                  msg: 'The note has been edited successfully',
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: const Color(0xff6DA4AA),
                  textColor: Colors.black,
                );
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(height: 50),
            CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hint: widget.note.title),
            const SizedBox(height: 24),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            EditNotesColorsList(note: widget.note)
          ],
        ),
      ),
    );
  }
}
