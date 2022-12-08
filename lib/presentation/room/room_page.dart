import 'package:flutter/material.dart';
import 'package:layer_architecture_template/utils/router/app_router.dart';

import '../../point_list.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({
    super.key,
    required this.roomId,
    required this.pointType,
  });

  static const String routeName = 'room';
  static const String routePath = '/room';

  final String roomId;
  final String pointType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: MediaQuery.of(context).size.width * 0.25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room ID: $roomId',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    'Your Name ：',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'XXXXXXXX',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 121, 121, 122),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Reset Estimate'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 64, 64, 243),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Open Estimate'),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: multipleOfTwoList
                      .map((point) => _PointTile(point: point))
                      .toList(),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Member',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Estimate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const _EstimateTile('XXXXXXXX', 0.5),
              const _EstimateTile('XXXXXXXX', 0.5),
              const _EstimateTile('XXXXXXXX', 0.5),
              const _EstimateTile('XXXXXXXX', 0.5),
              const Divider(),
              const Text(
                'Room Information',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    'Link to this room: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppRouter().launchURL('https://example.com/room/1234');
                    },
                    child: const Text(
                      'https://example.com/room/1234',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PointTile extends StatelessWidget {
  const _PointTile({
    required this.point,
  });

  final double point;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 41, 140, 163),
        ),
        child: Text(
          '$point pt',
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class _EstimateTile extends StatelessWidget {
  const _EstimateTile(
    this.name,
    this.estimate,
  );

  final String name;
  final double estimate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 80,
        right: 100,
        top: 4,
        bottom: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            estimate.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
