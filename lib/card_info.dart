import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'customDialog.dart';

class CardInfo extends StatefulWidget {
  final int index;
  final String siteName;
  final String status;
  final String adress;
  final String heure;
  final String distanceTotale;
  final String nombreColis;
  final String poidsTotal;
  final String volumeTotal;
  const CardInfo({
    super.key,
    required this.index,
    required this.siteName,
    required this.status,
    required this.adress,
    required this.heure,
    required this.distanceTotale,
    required this.nombreColis,
    required this.poidsTotal,
    required this.volumeTotal,
  });

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(14.0),
                margin: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFF275C7E),
                ),
                child: Text(
                  '${widget.index + 1}',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.siteName}",
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 11,
                          color: const Color(0xff17384E).withOpacity(.75),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      '${widget.status}',
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xff17384E),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14.0),
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xFFEFF5F8),
              ),
              child: Center(
                child: Opacity(
                  opacity: 1,
                  child: SvgPicture.asset(
                      'assets/images/icons/svg/anomaly-warning.svg',
                      height: 24,
                      semanticsLabel: 'Anomalie'),

                  // child: Image.asset(
                  //     'assets/images/icons/others/warning_icon.png'),
                ),
              ),
            ),
          ],
        ),
        const Divider(thickness: 2),
        if (_isExpanded)
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: Wrap(
              spacing: 14.0,
              children: [
                _buildInfoColumn('Adresse:', '${widget.adress}'),
                _buildInfoColumn('Heure:', '${widget.heure}'),
                _buildInfoColumn(
                    'Distance totale:', '${widget.distanceTotale}'),
                _buildInfoColumn('Nombre de colis:', "${widget.nombreColis}"),
                _buildInfoColumn('Poids total:', '${widget.poidsTotal}'),
                _buildInfoColumn('Volume total:', '${widget.volumeTotal}'),
              ],
            ),
          ),
        if (_isExpanded) SizedBox(height: 10),
        Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .15),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Button 1 onPressed logic
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEFF5F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Détails',
                  style: TextStyle(color: Color(0xff17384E)),
                ),
              ),
              SizedBox(width: 10), // Adjust the spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  // Button 2 onPressed logic
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEFF5F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Guidage',
                  style: TextStyle(color: Color(0xff17384E)),
                ),
              ),
              SizedBox(width: 10), // Adjust the spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEFF5F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'status',
                  style: TextStyle(color: Color(0xff17384E)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color(0xff17384E).withOpacity(.75),
                fontWeight: FontWeight.bold,
                fontSize: 12 - 1,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: const Color(0xff17384E),
                fontWeight: FontWeight.normal,
                fontSize: 12 - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
