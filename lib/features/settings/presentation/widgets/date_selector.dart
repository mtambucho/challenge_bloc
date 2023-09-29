import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({
    required this.onDateSelected,
    super.key,
    this.selectedDate,
  });
  final void Function(DateTime?) onDateSelected;
  final DateTime? selectedDate;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime date;
  Key key = UniqueKey();
  @override
  void initState() {
    date = widget.selectedDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  context.l10n.firstDay,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  widget.onDateSelected.call(null);
                  Navigator.pop(context);
                },
                child: Text(
                  context.l10n.cancel,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  key = UniqueKey();
                  date = DateTime.now();
                });
              },
              child: Text(
                context.l10n.today,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              key: key,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: date,
              onDateTimeChanged: (date) {
                setState(() {
                  this.date = date;
                });
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.onDateSelected.call(date);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  context.l10n.done,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
