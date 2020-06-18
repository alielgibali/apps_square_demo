import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovola_demo/api/api_client.dart';
import 'package:inovola_demo/models/reverse_details.dart';
import 'package:inovola_demo/api/error_response.dart';
import 'package:inovola_demo/presenter/reserve_details_presenter.dart';
import 'package:inovola_demo/screens/widgets/images.dart';
import 'package:inovola_demo/screens/widgets/reservation_type.dart';
import 'package:intl/intl.dart' as intl;

class ReverseDetails extends StatefulWidget {
  @override
  ReverseDetailsState createState() => ReverseDetailsState();
}

class ReverseDetailsState extends State<ReverseDetails>
    implements ReserveDetailsContract {
  ReserveDetailsPresenter _presenter;
  ReverseDetailsState() {
    _presenter = ReserveDetailsPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    _presenter.loadReverseDetails();
  }

  ReverseDetailsModel _myItem;
  bool _isLoading = true;
  bool _hasData = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showError(String error) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(
          seconds: 2,
        ),
        content: Text(
          error,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: !_hasData
          ? Center(
              child: Text(
                'Something Went Wrong Try Again Later.',
              ),
            )
          : _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Images(_myItem.img),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "التكلفة " +
                                      _myItem.price.toString() +
                                      " جنيه",
                                  style: GoogleFonts.lato(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '# ${_myItem.interest}',
                                  textAlign: TextAlign.right,
                                  // textDirection: TextDirection.rtl,
                                  style: GoogleFonts.lato(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${_myItem.title}',
                              textAlign: TextAlign.right,
                              // textDirection: TextDirection.rtl,
                              style: GoogleFonts.lato(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  intl.DateFormat(
                                    'EEEE dd MMMM ',
                                  ).add_jm().format(
                                        DateTime.parse(_myItem.date),
                                      ),
                                  style: GoogleFonts.lato(color: Colors.grey),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.date_range,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  _myItem.address,
                                  style: GoogleFonts.lato(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.location_on, color: Colors.grey),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  _myItem.trainerName,
                                  style: GoogleFonts.lato(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                    _myItem.trainerImg
                                        .replaceFirst(RegExp('s'), ''),
                                  ),
                                  backgroundColor: Colors.transparent,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              _myItem.trainerInfo,
                              style: GoogleFonts.lato(color: Colors.grey),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.4,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              child: Text(
                                'عن الدورة',
                                style: GoogleFonts.lato(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              _myItem.occasionDetail,
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.lato(
                                color: Colors.grey,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.4,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                // horizontal: 8,
                                vertical: 5,
                              ),
                              child: Text(
                                'تكلفة الدورة',
                                style: GoogleFonts.lato(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ..._myItem.reservTypes
                                .map(
                                  (reverse) => ReservationType(
                                    reverseType: reverse,
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'قم بالحجز الان',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                          color: Colors.purple[600],
                        ),
                      )
                    ],
                  ),
                ),
    );
  }

  @override
  void onLoadReserveDetailsError(ErrorResponse errorResponse) {
    _showError(
      genericHandleErrorResponse(errorResponse),
    );
    setState(() {
      _isLoading = false;
      _hasData = false;
    });
  }

  @override
  void onLoadReserveDetailsCompelete(ReverseDetailsModel items) {
    if (items != null) {
      setState(() {
        _isLoading = false;
        _myItem = items;
      });
    }
    if (items == null) {
      setState(() {
        _isLoading = false;
        _hasData = false;
      });
      _showError(
        "There is No Data Right Now. Try Again Later",
      );
    }
  }
}
