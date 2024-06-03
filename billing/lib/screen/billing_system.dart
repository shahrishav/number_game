import 'package:flutter/material.dart';

class BillingSystemScreen extends StatefulWidget {
  const BillingSystemScreen({super.key});

  @override
  State<BillingSystemScreen> createState() => _BillingSystemScreenState();
}

class _BillingSystemScreenState extends State<BillingSystemScreen> {
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Time : ${time!.hour}:${time!.minute}',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time!,
                    );
                    if (newTime != null) {
                      setState(() {
                        time = newTime;
                      });
                    }
                  },
                  child: const Text('Change Time'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text('Date : ${date!.day}/${date!.month}/${date!.year}'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050));
                    if (newDate != null) {
                      setState(() {
                        date = newDate;
                      });
                    }
                  },
                  child: const Text('Change Date'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                children: [
                  Text("Bill"),
                  Row(
                    children: [
                      Text("Total Days"),
                      Spacer(),
                      Text("2345678"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price per night"),
                      Spacer(),
                      Text("3200"),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("Sub total"),
                      Spacer(),
                      Text("2345678"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("VAT"),
                      Spacer(),
                      Text("13%"),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text("Total "),
                      Spacer(),
                      Text("2345678"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}