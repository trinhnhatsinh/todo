import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

import 'package:boilerplate/widgets/common/create_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.search);
              },
              icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Color(0xFFF8F8F8),
      floatingActionButton: CreateTodoWidget(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(Dimens.md_padding),
        child: Column(
          children: [
            InkWell(
                onTap: () => Navigator.of(context).pushNamed(Routes.allNote),
                child: Container(
                  padding: EdgeInsets.all(Dimens.md_padding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.all_inbox),
                          SizedBox(
                            width: Dimens.md_padding,
                          ),
                          Text('All')
                        ],
                      ),
                      // Text('2')
                    ],
                  ),
                )),
            SizedBox(
              height: Dimens.md_padding,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.todayNote),
              child: Container(
                padding: EdgeInsets.all(Dimens.md_padding),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.today),
                        SizedBox(
                          width: Dimens.md_padding,
                        ),
                        Text('Today')
                      ],
                    ),
                    // Text('2')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Dimens.md_padding,
            ),
            InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.upcomingNote),
                child: Container(
                  padding: EdgeInsets.all(Dimens.md_padding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.upcoming),
                          SizedBox(
                            width: Dimens.md_padding,
                          ),
                          Text('Upcoming')
                        ],
                      ),
                      // Text('2')
                    ],
                  ),
                ))
          ],
        ),
      )),
    ));
  }
}
