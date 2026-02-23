import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';
import 'package:petAblumMobile/core/widgets/common_app_back_bar_scaffold.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBackAppBar(
        title: '설정',
      ),
      backgroundColor: AppColors.bg,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          _fixedCard(
            child: _card('계정', [
              _item('개인정보 변경'),
              _item('비밀번호 변경'),
              _item('펫시터 계정으로 전환'),
            ]),
          ),

          const SizedBox(height: 16),

          _fixedCard(
            child: _card('알림', [
              _item('메시지 알림'),
              _item('펫시터 알림'),
            ]),
          ),

          const SizedBox(height: 16),

          _fixedCard(
            child: _card('보안', [
              _item('로그인 기기 관리'),
            ]),
          ),

          const SizedBox(height: 16),

          _fixedCard(
            child: _card('도움', [
              _item('자주 묻는 질문'),
              _item('고객센터'),
            ]),
          ),

          const SizedBox(height: 16),

          _fixedCard(
            child: _card('약관 및 정책', [
              _item('서비스 이용 약관'),
              _item('개인정보 처리 방침'),
            ]),
          ),

          const SizedBox(height: 16),

          _fixedCard(
            child: _cardOnlyItems([
              _item('로그아웃', showArrow: false),
              _item(
                '회원탈퇴',
                showArrow: false,
                color: Colors.red,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

/// 🔥 350 고정 + 가운데 정렬
Widget _fixedCard({required Widget child}) {
  return Center(
    child: SizedBox(
      width: 350,
      child: child,
    ),
  );
}

Widget _card(String title, List<Widget> items) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.subtitle20M120.copyWith(
            color: AppColors.f05,
          ),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    ),
  );
}

Widget _item(
    String text, {
      bool showArrow = true,
      Color? color,
    }) {
  return SizedBox(
    height: 36,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.body16R120.copyWith(
            color: color ?? AppColors.f04,
          ),
        ),
        if (showArrow)
          SvgPicture.asset(
            'assets/system/icons/chevron_right.svg',
            width: 24,
            height: 24,
          ),
      ],
    ),
  );
}

Widget _cardOnlyItems(List<Widget> items) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        items.length,
            (index) => Padding(
          padding: EdgeInsets.only(
            bottom: index == items.length - 1 ? 0 : 8,
          ),
          child: items[index],
        ),
      ),
    ),
  );
}