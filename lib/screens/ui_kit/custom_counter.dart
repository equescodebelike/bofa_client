import 'package:flutter/material.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({
    super.key,
    required this.title,
    required this.count,
    required this.increase,
    required this.decrease,
  });

  final String title;
  final int count;
  final VoidCallback increase;
  final VoidCallback decrease;

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int _count = 1;
  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 234,
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 87,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: _count > 1
                      ? () {
                          setState(() {
                            widget.decrease();
                            _count--;
                          });
                        }
                      : null,
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
              ),
              Text(_count.toString()),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.increase();
                      _count++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
