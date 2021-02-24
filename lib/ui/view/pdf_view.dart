import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:pastpapers/ui/widgets/commons.dart';

import '../../core/models/past_papers.dart';
import '../shared/app_colors.dart';
import '../shared/ui_helper.dart';

class PdfView extends StatefulWidget {
  final Papers papers;

  const PdfView({Key key, this.papers}) : super(key: key);
  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  String url;
  bool _isLoading = true;
  bool error = false;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    url = widget.papers.url;
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _isLoading = true;
    });
    try {
      document = await PDFDocument.fromURL(url);
    } catch (e) {
      error = true;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        primary: true,
        children: [
          UIHelper.verticalSpaceMedium(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 10.0),
                    maxLines: 1,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline1,
                      text: "${widget.papers.name} - (${widget.papers.year})",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
            ),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              children: [
                error == true
                    ? noConnection(context)
                    : Container(
                        height: MediaQuery.of(context).size.height - 120,
                        // child: getProgrammes(model.pastPaper),
                        child: Center(
                          child: _isLoading
                              ? Commons.showLoading("Loading Paper..")
                              : PDFViewer(
                                  document: document,
                                  showIndicator: true,
                                  showPicker: false,
                                  
                                  // indicatorBackground: Theme.of(context).primaryColor,
                                  // indicatorPosition: Positioned(to),
                                ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget noConnection(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  radius: 25,
                  backgroundColor: backgroundColor,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "No Internet Connection!",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Tap to Back",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "If you download it once, It does not download",
                  style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
                Text(
                  "again!",
                  style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
