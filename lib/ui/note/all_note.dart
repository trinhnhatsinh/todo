import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/models/note/note_datasource.dart';
import 'package:boilerplate/stores/note/note_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

import 'package:boilerplate/widgets/common/create_todo.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AllNoteScreen extends StatefulWidget {
  const AllNoteScreen({Key? key}) : super(key: key);

  @override
  _AllNoteScreenState createState() => _AllNoteScreenState();
}

class _AllNoteScreenState extends State<AllNoteScreen> {
  void update(NoteModel val) {
    var uuid = Uuid();

    val.checked = !val.checked;

    NoteStore _noteStore = Provider.of<NoteStore>(context, listen: false);

    _noteStore.check(val);
  }

  void delete(NoteModel val) {
    val.checked = !val.checked;

    NoteStore _noteStore = Provider.of<NoteStore>(context, listen: false);

    _noteStore.delete(val);
  }

  @override
  void initState() {
    NoteStore _noteStore = Provider.of<NoteStore>(context, listen: false);
    _noteStore.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NoteStore _noteStore = Provider.of<NoteStore>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'All Note',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios))),
      backgroundColor: Color(0xFFF8F8F8),
      floatingActionButton: CreateTodoWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.md_padding),
          child: Observer(builder: (context) {
            return Column(
              children: [
                ..._noteStore.notes.map(
                  (e) => Container(
                    padding: EdgeInsets.all(Dimens.md_padding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => update(e),
                              child: Icon(Icons.check_circle,
                                  color: e.checked
                                      ? Colors.greenAccent
                                      : Color(0xFF8C8C8C)),
                            ),
                            SizedBox(
                              width: Dimens.md_padding,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF595959),
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: Dimens.xs_padding,
                                ),
                                Text(
                                  e.date + ' ' + e.time,
                                  style: TextStyle(
                                      color: Color(0xFF8C8C8C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: Dimens.xs_padding,
                                ),
                                Text(e.description),
                              ],
                            )
                          ],
                        ),
                        InkWell(
                            onTap: () => delete(e),
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    ));
  }
}
