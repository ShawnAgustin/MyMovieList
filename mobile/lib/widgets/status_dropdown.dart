import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/models/enums/movie_status.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class StatusDropDown extends StatelessWidget {
  const StatusDropDown(this.status);
  final Status status;
  @override
  Widget build(BuildContext context) { 
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Status:',
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenManager.wp(2.5)),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(ScreenManager.wp(100)))),
          child: DropdownButton<String>(
            underline: Container(),
            selectedItemBuilder: (context) {
              return Status.values.map<Widget>((Status item) {
                String statusName = MovieStatus.getStatusName(item);
                return Container(
                  alignment: Alignment.center,
                  width: ScreenManager.wp(20),
                  child: AutoSizeText(
                    statusName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }).toList();
            },
            value: MovieStatus.getStatusName(status),
            icon: const Icon(Icons.keyboard_arrow_down),
            onChanged: (String val) {},
            items: Status.values.map<DropdownMenuItem<String>>((Status value) {
              String statusName = MovieStatus.getStatusName(value);
              return DropdownMenuItem<String>(
                value: statusName,
                child: Text(
                  statusName,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
