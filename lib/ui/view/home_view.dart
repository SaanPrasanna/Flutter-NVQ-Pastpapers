import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/enums/veiw_state.dart';
import '../../core/models/past_papers.dart';
import '../../core/viewmodels/pastpapers_model.dart';
import '../shared/app_colors.dart';
import '../shared/my_theme_provider.dart';
import '../shared/ui_helper.dart';
import '../widgets/commons.dart';
import '../widgets/mybehavior.dart';
import 'base_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sandunpmapa@gmail.com',
      queryParameters: {'subject': 'NVQ Past Paper!'});

  @override
  Widget build(BuildContext context) {
    return BaseView<PastPapersModel>(
      onModelReady: (model) => model.getPastpapers(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          children: [
            UIHelper.verticalSpaceMedium(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Icon(Icons.menu, color: Colors.white),
                  Consumer<MyThemeModel>(
                    builder: (context, theme, child) => IconButton(
                      icon: Icon(
                          theme.isLisghtTheme ? EvaIcons.sun : EvaIcons.moon),
                      onPressed: () => theme.changeTheme(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text("About Developer"),
                          content: Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Text("All rights reserved Sandun Prasanna(C3)."),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "If you want more details, please contact me."),
                            ],
                          ),
                          actions: [
                            CupertinoDialogAction(
                                child: Text("Contact me"),
                                onPressed: () {
                                  launch(_emailLaunchUri.toString());
                                }),
                            CupertinoDialogAction(
                              child: Text("Done"),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Color(0xFFE4E4E4),
                    icon: Icon(Icons.info),
                  ),
                ],
              ),
            ),
            // UIHelper.verticalSpaceMedium(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "NVQ Past Papers",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              ),
              height: MediaQuery.of(context).size.height - 168,
              child: ListView(
                primary: false,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: model.state == ViewState.Busy
                          ? Commons.showLoading("Loading Papers")
                          : model.pastPaper == null
                              ? GestureDetector(
                                  onTap: () => model.getPastpapers(),
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            child: Icon(
                                              Icons.refresh,
                                              color: Colors.white,
                                            ),
                                            radius: 25,
                                            backgroundColor: backgroundColor,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Connection Failed!",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          Text(
                                            "Tap to refresh",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Consumer<MyThemeModel>(
                                  builder: (context, theme, child) =>
                                      RefreshIndicator(
                                    color: Theme.of(context).primaryColor,
                                    onRefresh: model.getPastpapers,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 12.0),
                                      child: getProgrammes(model.pastPaper),
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getProgrammes(PastPaper all) => ListView.builder(
        itemCount: all.programme.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(all.programme[index]);
              Navigator.of(context)
                  .pushNamed('semesterView', arguments: all.programme[index]);
            },
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    all.programme[index].programme.characters.first,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  radius: 20,
                ),
                title: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  maxLines: 2,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    // style: TextStyle(
                    //   fontSize: 15,
                    //   fontWeight: FontWeight.w400,
                    //   color: Colors.black,
                    // ),
                    text: "${all.programme[index].programme}",
                  ),
                ),
              ),
            ),
          );
        },
      );
}
