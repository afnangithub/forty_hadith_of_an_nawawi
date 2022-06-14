import 'package:flutter/material.dart';
import 'package:forty_hadith_of_an_nawawi/model/hadith.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreenX extends StatelessWidget {
  final Hadith hadith;
  const DetailScreenX({Key? key, required this.hadith}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPageX(hadith: hadith);
        } else {
          return DetailMobilePageX(hadith: hadith);
        }
      },
    );
  }
}

class DetailMobilePageX extends StatelessWidget {
  final Hadith hadith;

  const DetailMobilePageX({Key? key, required this.hadith}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Text(
                'Forty Hadith of an-Nawawi',
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 32,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Center(child: Image.asset(hadith.imageAsset)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const MarkButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Text(
                hadith.contain,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                hadith.authority,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                hadith.mean,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                hadith.reference,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPageX extends StatefulWidget {
  final Hadith hadith;

  const DetailWebPageX({Key? key, required this.hadith}) : super(key: key);

  @override
  _DetailWebPageStateX createState() => _DetailWebPageStateX();
}

class _DetailWebPageStateX extends State<DetailWebPageX> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Text(
                'Forty Hadith of an-Nawawi',
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 32,
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                const SizedBox(height: 200),
                Center(
                  child: SizedBox(
                    child: Image.asset(widget.hadith.imageAsset),
                    height: 200,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const MarkButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Text(
                widget.hadith.contain,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.hadith.authority,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.hadith.mean,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.hadith.reference,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class MarkButton extends StatefulWidget {
  const MarkButton({Key? key}) : super(key: key);

  @override
  _MarkButtonState createState() => _MarkButtonState();
}

class _MarkButtonState extends State<MarkButton> {
  bool isMark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isMark ? Icons.bookmark : Icons.bookmark_border,
        color: Colors.lightGreen,
      ),
      onPressed: () {
        setState(() {
          isMark = !isMark;
        });
      },
    );
  }
}
