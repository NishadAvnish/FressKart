import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';

class PersonScreen extends StatefulWidget {
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  ScrollController _scrollController;
  bool _isLoading;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      offset.value = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(gradient: mainColorGradient)),
            floating: true,
            title: Text(
              "Profile",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            sliver: SliverToBoxAdapter(
                child: Column(children: [
              _fullDetail(context),
              SizedBox(height: 15),
              _updateNameandAddress("You Full Name", "Enter Correct Name", 1),
              SizedBox(height: 15),
              _updateNameandAddress("Mobile No.", "Enter New Number", 1),
              SizedBox(height: 15),
              _updateNameandAddress("Address", "Enter New Address", 4),
              SizedBox(height: 15),
              _updateNameandAddress("Area", "Enter Area", 1),
              SizedBox(height: 15),
              _updateNameandAddress("Pincode", "Enter Your Area Pincode", 1),
              SizedBox(height: 25),
              MaterialButton(
                onPressed: () {},
                minWidth: 160,
                color: ternaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text("Upload",
                    style: Theme.of(context).textTheme.headline6),
              ),
              SizedBox(height: kToolbarHeight)
            ])),
          )
        ],
      ),
    );
  }

  Widget _fullDetail(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        maxRadius: 50.0,
        minRadius: 40.0,
      ),
      SizedBox(height: 12),
      Text(
        "Avnish",
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
      ),
      Text(
        "8826331014",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ]);
  }

  Widget _updateNameandAddress(String heading, String hintText, int maxLines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          heading,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 3),
        TextField(
          maxLines: maxLines,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.black),
          decoration: InputDecoration(
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        )
      ],
    );
  }
}
