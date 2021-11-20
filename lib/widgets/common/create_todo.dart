import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/models/note/note_datasource.dart';
import 'package:boilerplate/stores/note/note_store.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:boilerplate/widgets/core/date_picker_widget.dart';
import 'package:boilerplate/widgets/core/textarea_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/core/time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CreateTodoWidget extends StatefulWidget {
  const CreateTodoWidget({Key? key}) : super(key: key);

  @override
  _CreateTodoWidgetState createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        openSortModal(context);
      },
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  void changeDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void changeTime(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  void create() {
    var uuid = Uuid();
    NoteStore _noteStore = Provider.of<NoteStore>(context, listen: false);

    _noteStore.add(NoteModel(
        date: '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
        description: _descriptionEditingController.text,
        id: uuid.v4(),
        time: '${selectedTime.hour}:${selectedTime.minute}',
        title: _titleEditingController.text,
        checked: false));

    clear();
    Navigator.of(context).pop();
  }

  void clear() {
    _titleEditingController.text = '';
    _descriptionEditingController.text = '';
    selectedTime = TimeOfDay.now();
    selectedDate = DateTime.now();
  }

  Widget _sortModalContent() {
    return Container(
      height: 360,
      child: Padding(
        padding: EdgeInsets.all(Dimens.md_padding),
        child: Column(
          children: [
            TextfieldWidget(
                hintText: 'Title', controller: _titleEditingController),
            SizedBox(
              height: Dimens.xs_padding,
            ),
            Row(
              children: [
                DatePickerWidget(
                    selectedDate: selectedDate, changeDate: changeDate),
                TimePickerWidget(
                    selectedTime: selectedTime, changeTime: changeTime),
              ],
            ),
            SizedBox(
              height: Dimens.xs_padding,
            ),
            TextAreaWidget(
                hintText: 'Description',
                controller: _descriptionEditingController),
            SizedBox(
              height: Dimens.xs_padding,
            ),
            InkWell(
              onTap: create,
              child: ButtonWidget(text: 'Create'),
            )
          ],
        ),
      ),
    );
  }

  void openSortModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.sm_padding),
            topRight: Radius.circular(Dimens.sm_padding)),
      ),
      builder: (BuildContext context) {
        return _sortModalContent();
      },
    );
  }
}
