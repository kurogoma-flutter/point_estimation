import 'package:flutter/material.dart';
import 'package:layer_architecture_template/enum/point_type.dart';
import 'package:layer_architecture_template/utils/router/app_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../room/room_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = 'home';
  static const String routePath = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PointType selectedOption = PointType.fibonacci;

  // 数列のサンプルを表示するWidget
  String sampleText() {
    switch (selectedOption) {
      case PointType.fibonacci:
        return '0.5, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...';
      case PointType.increment:
        return '0.5, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, ...';
      case PointType.multipleOfTwo:
        return '0.5, 1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, ...';
      case PointType.custom:
        return '1~100までの数値を自由に選択できます';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // 幅のメディアクエリ対応（Form）
    double formWidth(BuildContext context) {
      final deviceType = getDeviceType(MediaQuery.of(context).size);
      switch (deviceType) {
        case DeviceScreenType.desktop:
          return 0.3;
        case DeviceScreenType.tablet:
          return 0.55;
        case DeviceScreenType.mobile:
          return 0.8;
        default:
          return 0.8;
      }
    }

    // 幅のメディアクエリ対応（Button）
    double buttonWidth(BuildContext context) {
      final deviceType = getDeviceType(MediaQuery.of(context).size);

      switch (deviceType) {
        case DeviceScreenType.desktop:
          return 0.2;
        case DeviceScreenType.tablet:
          return 0.35;
        case DeviceScreenType.mobile:
          return 0.5;
        default:
          return 0.8;
      }
    }

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // タイトルテキスト
            const Text(
              'ルームを作成しましょう！',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            // 名前を入れるTextField
            Container(
              width: screenSize.width * formWidth(context),
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'あなたの名前を入力してください',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            // タイトル
            const Text(
              'ポイントタイプを選択してください',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            // タイプを選択するRadioButton（横並び）
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = PointType.fibonacci;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: _RadioButton(
                      label: 'フィボナッチ',
                      isSelected: selectedOption == PointType.fibonacci,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = PointType.increment;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: _RadioButton(
                      label: 'インクリメント',
                      isSelected: selectedOption == PointType.increment,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = PointType.multipleOfTwo;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: _RadioButton(
                      label: '2の階乗',
                      isSelected: selectedOption == PointType.multipleOfTwo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = PointType.custom;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: _RadioButton(
                      label: 'カスタム',
                      isSelected: selectedOption == PointType.custom,
                    ),
                  ),
                ],
              ),
            ),

            // ルーム作成ボタン
            SizedBox(
              width: screenSize.width * buttonWidth(context),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  AppRouter().goNamed(
                    context,
                    RoomPage.routeName,
                    params: {
                      'roomId': '1234',
                      'pointType': 'fibonacci',
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'ルーム作成',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                sampleText(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ラジオボタン
class _RadioButton extends StatelessWidget {
  const _RadioButton({
    required this.label,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          isSelected
              ? const _SelectedRadioButton()
              : const _UnselectedRadioButton(),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

/// 選択状態のラジオボタン
class _SelectedRadioButton extends StatelessWidget {
  const _SelectedRadioButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 54, 57, 241),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}

/// 未選択状態のラジオボタン
class _UnselectedRadioButton extends StatelessWidget {
  const _UnselectedRadioButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 200, 201, 253),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}
