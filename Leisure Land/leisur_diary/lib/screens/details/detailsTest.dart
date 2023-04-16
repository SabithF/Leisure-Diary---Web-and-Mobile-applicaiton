// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/models/reservation.dart';
import 'package:travel_app_ui/screens/home/homepage.dart';
import 'package:travel_app_ui/services/apiServices/sendReservation.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:travel_app_ui/utils/glass_box.dart';
import '../../models/AccomModel.dart';
import '../../models/places.dart';

class TestDetailsPage extends StatefulWidget {
  final Places places;
  final Accomodation accomodation;
  late Reservation reservation;

  TestDetailsPage({
    Key? key,
    required this.accomodation,
    required this.places,
  }) : super(key: key);

  @override
  State<TestDetailsPage> createState() => _TestDetailsPageState();
}

class _TestDetailsPageState extends State<TestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding / 2),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height / 1.9,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.places.image),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.accomodation.title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: greyColor,
                                      size: 18,
                                    ),
                                    Text(
                                      widget.accomodation.location.toString(),
                                      style: TextStyle(color: greyColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 11,
                              width: MediaQuery.of(context).size.width / 3.5,
                              padding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.places.image),
                                ),
                              ),
                              child: Material(
                                elevation: 0.1,
                                shadowColor: Colors.black54,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                child: const GlassBox(
                                  radius: 50,
                                  child: Text(
                                    'Veiw map',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          widget.places.info,
                          style: TextStyle(
                            color: greyColor,
                            fontWeight: FontWeight.bold,
                            height: 2,
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: defaultPadding,
                bottom: defaultPadding / 2,
                left: defaultPadding,
                right: defaultPadding,
              ),
              color: backgroundColor,
              height: MediaQuery.of(context).size.height / 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rs.${widget.accomodation.title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        '\\Per person',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () async {
                      final reservation = Reservation(
                        username: "Username",
                        phone: widget.accomodation.phone.toString(),
                        title: widget.accomodation.title.toString(),
                        price: widget.accomodation.price.toString(),
                        date: widget.accomodation.startDate.toString(),
                      );

                      await sendReservation(reservation);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Reservation successful')),
                      // );

                      _showReservationSuccessDialog(reservation);
                    },
                    height: MediaQuery.of(context).size.height / 15,
                    minWidth: MediaQuery.of(context).size.width / 1.9,
                    textColor: Colors.white,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void generateReceipt(Reservation reservation) {
  //   final pdf = pw.Document();

  //   pdf.addPage(pw.Page(
  //     build: (pw.Context context) {
  //       return pw.Center(
  //           child: pw.Column(
  //               mainAxisAlignment: pw.MainAxisAlignment.center,
  //               children: [
  //             pw.Text('Reservation Details'),
  //             pw.SizedBox(height: 20),
  //             pw.Text('Name: ${reservation.username}'),
  //             pw.SizedBox(height: 10),
  //             pw.Text('title: ${reservation.title}'),
  //             pw.SizedBox(height: 10),
  //             pw.Text('Date: ${reservation.date}'),
  //             pw.SizedBox(height: 10),
  //             pw.Text('price: ${reservation.price}'),
  //             pw.SizedBox(height: 20),
  //             pw.Text('price: ${reservation.phone}'),
  //             pw.SizedBox(height: 20),
  //             pw.Container(width: 200, height: 200)
  //           ]));
  //     },
  //   ));
  // }

  void _showReservationSuccessDialog(Reservation reservation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reservation successful"),
          content: Text(
              "Your reservation has been confirmed. Do you want to download the receipt?"),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            TextButton(
              child: Text("Download"),
              onPressed: () {
                generateReceipt(reservation);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> generateReceipt(Reservation reservation) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
              pw.Text('Reservation Details'),
              pw.SizedBox(height: 20),
              pw.Text('Name: ${reservation.username}'),
              pw.SizedBox(height: 10),
              pw.Text('Title: ${reservation.title}'),
              pw.SizedBox(height: 10),
              pw.Text('Date: ${reservation.date}'),
              pw.SizedBox(height: 10),
              pw.Text('Price: ${reservation.price}'),
              pw.SizedBox(height: 20),
              pw.Text('Phone: ${reservation.phone}'),
              pw.SizedBox(height: 20),
              pw.Container(width: 200, height: 200)
            ]));
      },
    ));
    // final bytes = await pdf.save();
    // final directory = await getApplicationDocumentsDirectory();
    // final file = File('${directory.path}/receipt.pdf');
    // print('Directory path: ${directory.path}');
    // await file.writeAsBytes(bytes);

    // final output = await getApplicationDocumentsDirectory();
    // final file = File('${output.path}/reservation.pdf');
    // await file.writeAsBytes(await pdf.save());
    // await openFile(file);
    Future<void> openFile(File file) async {
      try {
        final bytes = await file.readAsBytes();
        await Printing.sharePdf(
            bytes: await pdf.save(), filename: 'invoice.pdf');
      } catch (e) {
        print(e.toString());
      }
    }

    //

    // final Directory directory = await getApplicationDocumentsDirectory();
    // final String documentPath = directory.path;
    // final String fileName = 'receipt.pdf';
    // // Generate the PDF file and write it to the document directory
    // final pdfFile = await generateReceipt(reservation);
    // File file = File('$documentPath/$fileName');
    // await file.writeAsBytes(pdfFile.save());
    // // Show a snackbar to indicate that the file has been downloaded
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('Receipt downloaded to $documentPath/$fileName'),
    // ));

    // // Open the downloaded file
    // OpenFile.open('$documentPath/$fileName');
  }
}
