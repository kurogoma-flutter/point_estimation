import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'home';
  static const String routePath = '/home';

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
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            // タイプを選択するRadioButton（横並び）
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _RadioButton(
                    label: 'フィボナッチ',
                    isSelected: false,
                  ),
                  _RadioButton(
                    label: '1 ~ 100',
                    isSelected: false,
                  ),
                  _RadioButton(
                    label: 'サンプル',
                    isSelected: true,
                  ),
                  SizedBox(width: 16),
                  _RadioButton(
                    label: 'T-サンプル',
                    isSelected: false,
                  ),
                ],
              ),
            ),

            // ルーム作成ボタン
            SizedBox(
              width: screenSize.width * buttonWidth(context),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
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
