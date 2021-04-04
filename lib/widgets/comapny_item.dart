import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:apps_square_demo/models/company_data_model.dart';

class ComapanyItem extends StatelessWidget {
  final ComapnyDataModel comapanyData;
  ComapanyItem({this.comapanyData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: comapanyData.companyLogo == null
            ? SizedBox(
                width: 100,
              )
            : Container(
                width: 100,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: comapanyData.companyLogo,
                  memCacheHeight: MediaQuery.of(context).size.height.toInt(),
                  imageBuilder: (context, imageProvider) => Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Container(
                    width: 30,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
        title: Text(
          comapanyData.title,
        ),
        subtitle: Text('Company' + comapanyData.company),
      ),
    );
  }
}
