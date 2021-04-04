import 'dart:convert';

List<ComapnyDataModel> getCompanyDetails(String data) {
  if (json.decode(data) == null) {
    return null;
  }

  final dyn = json.decode(data) as List;
  List<ComapnyDataModel> myList = [];
  myList = dyn.map((e) => ComapnyDataModel.fromJson(e)).toList();
  return myList;
}

class CompanyJson {
  List<ComapnyDataModel> companyJson;
  CompanyJson(this.companyJson);
}

class ComapnyDataModel {
  String id;
  String type;
  String url;
  String createdAt;
  String company;
  String companyUrl;
  String location;
  String title;
  String description;
  String howToApply;
  String companyLogo;

  ComapnyDataModel(
      {this.id,
      this.type,
      this.url,
      this.createdAt,
      this.company,
      this.companyUrl,
      this.location,
      this.title,
      this.description,
      this.howToApply,
      this.companyLogo});

  ComapnyDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    url = json['url'];
    createdAt = json['created_at'];
    company = json['company'];
    companyUrl = json['company_url'];
    location = json['location'];
    title = json['title'];
    description = json['description'];
    howToApply = json['how_to_apply'];
    companyLogo = json['company_logo'];
  }
}
