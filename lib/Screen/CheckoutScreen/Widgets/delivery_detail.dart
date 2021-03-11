import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:provider/provider.dart';

class DeliveryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Consumer<PersonProvider>(builder: (context, personProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(personProvider.personDetail.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15.0)),
                SizedBox(
                  height: 8.0,
                ),
                Flexible(
                  child: Text(personProvider.personDetail.address,
                      style: TextStyle(color: Colors.black54, fontSize: 15.0)),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
