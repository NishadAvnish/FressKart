import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';
import '../Provider/person_detail_provider.dart';
import '../model/person_model.dart';

class PersonScreen extends StatefulWidget {
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  ScrollController _scrollController;
  bool _isLoading;
  PersonModel _personDetail;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _scrollController = ScrollController();
    if (this.mounted)
      _scrollController.addListener(() {
        offset.value = _scrollController.offset;
      });
    fetch();
  }

  Future<void> fetch() async {
    if (mounted) {
      await Provider.of<PersonProvider>(context, listen: false).fetchDetail();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _personDetail =
        Provider.of<PersonProvider>(context, listen: false).personDetail;

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
          _isLoading
              ? SliverFillRemaining(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 12.0),
                        child: Column(children: [
                          _fullDetail(context),
                          SizedBox(height: 15),
                          _updatableField(
                              heading: "You Full Name",
                              controller: TextEditingController(
                                  text: _personDetail.name),
                              maxLines: 1),
                          SizedBox(height: 15),
                          _updatableField(
                            heading: "Mobile No.",
                            controller: TextEditingController(
                                text: _personDetail.phoneNo),
                            maxLines: 1,
                            isEnable: false,
                          ),
                          SizedBox(height: 15),
                          _updatableField(
                              heading: "Address",
                              controller: TextEditingController(
                                  text: _personDetail.address),
                              maxLines: 4),
                          SizedBox(height: 15),
                          _updatableField(
                              heading: "Area",
                              controller: TextEditingController(
                                  text: _personDetail.area),
                              maxLines: 1),
                          SizedBox(height: 15),
                          _updatableField(
                              heading: "Pincode",
                              controller: TextEditingController(
                                  text: _personDetail.pincode),
                              maxLines: 1),
                          SizedBox(height: 25),
                          MaterialButton(
                            onPressed: () {},
                            minWidth: 160,
                            color: ternaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Text("Update",
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          SizedBox(height: kToolbarHeight)
                        ]),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _fullDetail(BuildContext context) {
    return Column(children: [
      Container(
          height: 60.0,
          width: 60.0,
          decoration:
              BoxDecoration(border: Border.all(), shape: BoxShape.circle),
          child: Icon(Icons.person)),
      SizedBox(height: 12),
      Text(
        _personDetail.name,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
      ),
      Text(
        _personDetail.phoneNo,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ]);
  }

  Widget _updatableField(
      {String heading,
      TextEditingController controller,
      int maxLines,
      bool isEnable = true}) {
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
          enabled: isEnable,
          controller: controller,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: isEnable ? Colors.black : Colors.grey),
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        )
      ],
    );
  }
}
