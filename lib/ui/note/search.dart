import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/constants/text_style.dart';
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

class SearchNoteScreen extends StatefulWidget {
  const SearchNoteScreen({Key? key}) : super(key: key);

  @override
  _SearchNoteScreenState createState() => _SearchNoteScreenState();
}

class _SearchNoteScreenState extends State<SearchNoteScreen> {
  TextEditingController _searchEditingController = TextEditingController();

  void search() {
    NoteStore _noteStore = Provider.of<NoteStore>(context, listen: false);

    _noteStore.search(_searchEditingController.text);
  }

  void update(NoteModel val) {
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
    _noteStore.search('');
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
        title: _searchBar(),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {
                search();
              },
              icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Color(0xFFF8F8F8),
      floatingActionButton: CreateTodoWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.md_padding),
          child: Observer(builder: (context) {
            return Column(
              children: [
                ..._noteStore.searchNotes.map(
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
                            onTap: () => update(e),
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

  Widget _searchBar() {
    return TextFormField(
      controller: _searchEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: Dimens.md_padding),
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        hintText: 'Tìm kiếm',
        hintStyle: TextStyles.searchBar['hint'],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE1E1E1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.colors['systemColor'] as Color),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE1E1E1)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
