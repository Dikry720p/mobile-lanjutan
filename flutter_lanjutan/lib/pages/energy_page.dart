import 'package:flutter/material.dart';

class EnergyMenu extends StatelessWidget {
  final List<Map<String, dynamic>> devices = [
    {"no": 1, "device": "Lampu 1", "power": "20W", "status": "Aktif"},
    {
      "no": 2,
      "device": "AC Ruang Tamu",
      "power": "900W",
      "status": "Non-aktif"
    },
    {"no": 3, "device": "Kipas Angin", "power": "50W", "status": "Aktif"},
    {"no": 4, "device": "Komputer", "power": "200W", "status": "Non-aktif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Perangkat"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 20,
                  border: TableBorder.all(
                    color: Colors.grey.shade300,
                    width: 1.0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  columns: [
                    DataColumn(
                      label: Text(
                        "No",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Perangkat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Daya",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Status",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: devices.map((device) {
                    bool isActive = device["status"] == "Aktif";
                    return DataRow(
                      cells: [
                        DataCell(Text(device["no"].toString())),
                        DataCell(Text(device["device"])),
                        DataCell(Text(device["power"])),
                        DataCell(
                          Row(
                            children: [
                              Icon(
                                isActive ? Icons.check_circle : Icons.cancel,
                                color: isActive ? Colors.green : Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text(
                                device["status"],
                                style: TextStyle(
                                  color: isActive ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EnergyMenu(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Roboto',
    ),
  ));
}
