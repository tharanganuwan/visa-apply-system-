import 'dart:io';
import 'package:alwaysvisa/models/genarator_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  // static Future<File> genaratePDF() async {
  //   final pdf = pw.Document();

  //   pdf.addPage(pw.Page(
  //     build: (context) => pw.Center(child: pw.Text("text")),
  //   ));

  //   return saveDocumet(name: "ecxampale", pdf: pdf);
  // }

  // static Future<File> saveDocumet({
  //   required String name,
  //   required pw.Document pdf,
  // }) async {
  //   final bytes = await pdf.save();
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/$name');

  //   await file.writeAsBytes(bytes);
  //   return file;
  // }

  static Future<File> genaratePDF(GenatorModel model) async {
    final pdf = pw.Document();
    List<pw.Container> pwText = [];
    var first = pw.Container(
      padding: pw.EdgeInsets.all(20),
      color: PdfColor.fromHex("CCFFFF"),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Header(child: pw.Text("Guarantor Details")),
          pw.Paragraph(text: "First Name:  ${model.firstname}"),
          pw.Paragraph(text: "Middle Name:  ${model.middlename}"),
          pw.Paragraph(text: "Last Name:  ${model.lastname}"),
          pw.Paragraph(text: "Gender:  ${model.gender}"),
          pw.Paragraph(text: "Nationality:  ${model.nationality}"),
          pw.Paragraph(text: "Company Name:  ${model.companyname}"),
          pw.Paragraph(
              text:
                  "Relationship with Passenger:  ${model.relationwithpassenger}"),
          pw.Paragraph(text: "Contact Number 1:  ${model.contactnumber1}"),
          pw.Paragraph(text: "Contact Number 2:  ${model.contactnumber2}"),
          pw.Paragraph(text: "Guarantor Email:  ${model.email}"),
          pw.SizedBox(height: 10),
          pw.Paragraph(
              text: "Mobile Number :  ${model.mobileNumber}",
              style: pw.TextStyle(color: PdfColor.fromHex("FD1111"))),
          pw.Paragraph(
              text: "Contact Email:  ${model.contactEmail}",
              style: pw.TextStyle(color: PdfColor.fromHex("FD1111"))),
          pw.Paragraph(
              text: "Arrive Date:  ${model.arrivalDate}",
              style: pw.TextStyle(color: PdfColor.fromHex("FD1111"))),
        ],
      ),
    );

    pwText.add(first);

    for (int i = 0; i < model.appcationmodellist!.length; i++) {
      var addList = pw.Container(
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                  child: pw.Text(model.appcationmodellist![i].applicanttype)),
              pw.Paragraph(
                  text:
                      "First Name:  ${model.appcationmodellist![i].firstname}"),
              pw.Paragraph(
                  text:
                      "Middle Name:  ${model.appcationmodellist![i].middlename}"),
              pw.Paragraph(
                  text: "Last Name:  ${model.appcationmodellist![i].lastname}"),
              pw.Paragraph(
                  text: "Gender:  ${model.appcationmodellist![i].gender}"),
              pw.Paragraph(
                  text:
                      "Nationality:  ${model.appcationmodellist![i].nationality}"),
              pw.Paragraph(
                  text:
                      "Passport Number:  ${model.appcationmodellist![i].passportnumber}"),
              pw.Paragraph(
                  text:
                      "Issure Date:  ${model.appcationmodellist![i].issuredate}"),
              pw.Paragraph(
                  text:
                      "Expire Date:  ${model.appcationmodellist![i].expirydate}"),
              pw.Paragraph(
                  text:
                      "Issure Place:  ${model.appcationmodellist![i].issureplace}"),
            ],
          ));

      pwText.add(addList);
    }

    pdf.addPage(
      pw.MultiPage(build: (context) => pwText //[
          ),
    );

    return saveDocumet(name: "ecxampale", pdf: pdf);
  }

  static Future<File> saveDocumet({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);
    return file;
  }
}
