import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery/SearchPage/SearchBar.dart';
import 'package:grocery/constrant.dart';
import 'package:grocery/SearchPage/SearchPage.dart';

class SearchBar extends StatelessWidget {
  String? search;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 45,
              width: size.width - kDefaultPadding * 2,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                  color: kNaturanWhite,
                  borderRadius: BorderRadius.circular(kDefaultPadding - 8)),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (text) {
                          search = text;
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, SearchPage.routeName,
                          arguments: SearchBarArgs(search: search));
                    },
                    child: SvgPicture.asset(
                      "images/icons/SearchOutline.svg",
                      height: 20,
                      width: 20,
                    ),
                  )
                ],
              )),
          // Container(
          //     margin: EdgeInsets.only(left: kDefaultPadding),
          //     child: SvgPicture.asset("images/icons/Adjustments.svg"))
        ],
      ),
    );
  }
}
