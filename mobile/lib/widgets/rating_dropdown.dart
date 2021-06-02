import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class RatingDropdown extends StatelessWidget {
  const RatingDropdown(this.rating);
  final int rating;

  static const List<int> ratings = [0, 1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Score:',
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
          padding: EdgeInsets.only(right: ScreenManager.wp(2.5), left: ScreenManager.wp(5)),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(ScreenManager.wp(100)))),
          child: DropdownButton<int>(
            value: 0,
            underline: Container(),
            icon: const Icon(Icons.keyboard_arrow_down),
            onChanged: (int val) {},
            items: ratings.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
