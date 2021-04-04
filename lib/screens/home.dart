import 'package:apps_square_demo/Providers/company_provider.dart';
import 'package:apps_square_demo/widgets/comapny_item.dart';
import 'package:flutter/material.dart';
import 'package:apps_square_demo/models/company_data_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comapny Data'),
      ),
      body: FutureBuilder(
        future:
            Provider.of<CompanyProvider>(context, listen: false).comapanyData(),
        builder: (_, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapShot.error != null) {
              return Center(
                child: Text(
                  'Something Went Wrong  Try Again Later!',
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              final List<ComapnyDataModel> data = snapShot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) => ComapanyItem(
                  comapanyData: data[index],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
