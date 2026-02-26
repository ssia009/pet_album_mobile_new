import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';
import 'package:petAblumMobile/core/widgets/common_app_back_bar_scaffold.dart';
import 'package:petAblumMobile/features/presentation/pages/auth/oauth2_login_form.dart';
import 'package:petAblumMobile/core/widgets/Withdrawal_Certification.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({super.key});

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBackAppBar(title: '회원탈퇴'),
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 탈퇴할 계정
                  _sectionCard(
                    title: '탈퇴할 계정',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        width: 318,
                        child: Text(
                          'aaa@gmail.com', // 실제 유저 이메일
                          style: AppTextStyle.body16R120.copyWith(
                            color: AppColors.f05,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 계정 복구 및 데이터 파기
                  _sectionCard(
                    title: '계정 복구 및 데이터 파기',
                    child: Column(
                      children: [
                        _bulletItem('탈퇴일로부터 30일 이내에는 개인정보와 데이터가 보존되며 복구할 수 있습니다.'),
                        _bulletItem('탈퇴일로부터 30일 이후에는 개인정보와 탈퇴 시간, 도중 등 관련된 모든 데이터가 삭제됩니다. 삭제된 데이터는 복구되지 않으니 필요한 데이터는 미리 백업해 주세요.'),
                        _bulletItem('전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령 및 본청 방침에 따라 필요한 정보는 법령이 정한 일정 기간 보관됩니다.'),
                        _bulletItem('개인정보 처리방침에 따라 분류 및 이용기간이 다른 특별한 경우는 해당 사유에 따릅니다.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 요금제 이용권 등의 환불
                  _sectionCard(
                    title: '요금제 이용권 등의 환불',
                    child: Column(
                      children: [
                        _bulletItem('유료로 구입하거나 무상으로 제공받은 요금제, 사용권, 이용권 등은 환불 또는 환급되지 않습니다.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 탈퇴 후 재가입
                  _sectionCard(
                    title: '탈퇴 후 재가입',
                    child: Column(
                      children: [
                        _bulletItem('탈퇴일로부터 30일 이후 재가입이 가능하며, 해당 계정의 이메일 주소로 재가입할 수 있습니다.'),
                        _bulletItem('단 기존 정보는 파기되어 복구할 수 없습니다.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 체크박스 카드
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() => _isChecked = !_isChecked),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            _isChecked
                                ? 'assets/system/icons/checkbox_on.svg'
                                : 'assets/system/icons/checkbox_off.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '탈퇴 주의사항을 모두 확인하였으며 동의합니다.',
                              style: AppTextStyle.description14R140.copyWith(
                                color: AppColors.f04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // 하단 버튼
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      side: BorderSide(color: AppColors.gray02, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(171, 55),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      '취소',
                      style: AppTextStyle.body16R120.copyWith(
                        color: AppColors.f05,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
    onPressed: _isChecked
    ? () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => WithdrawalCertificationPage(),
    ),
    );
    }
        : null,
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
    return AppColors.bg;      // 체크 안됐을 때 배경색
    }
    return AppColors.black;    // 체크됐을 때 배경색
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
    return AppColors.f03;     // 체크 안됐을 때 텍스트색
    }
    return AppColors.f01;       //  체크됐을 때 텍스트색
    }),
    side: MaterialStateProperty.all(
    BorderSide(color: AppColors.gray01, width: 1.5),
    ),
    shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
    ),
    minimumSize: MaterialStateProperty.all(const Size(151, 55)),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    elevation: MaterialStateProperty.all(0),
    ),
                    child: Text(
                      '다음',
                      style: AppTextStyle.body16R120.copyWith(

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
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
            style: AppTextStyle.body16M120.copyWith(
              color: AppColors.f05,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _bulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: 318,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• ', style: AppTextStyle.description14R140.copyWith(color: AppColors.f04)),
            Expanded(
              child: Text(
                text,
                style: AppTextStyle.description14R140.copyWith(color: AppColors.f04),
              ),
            ),
          ],
        ),
      ),
    );
  }
}