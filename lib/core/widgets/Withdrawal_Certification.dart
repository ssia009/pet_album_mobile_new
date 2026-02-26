import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';
import 'package:petAblumMobile/core/widgets/common_app_back_bar_scaffold.dart';
import 'package:petAblumMobile/features/presentation/pages/auth/oauth2_login_form.dart';

class WithdrawalCertificationPage extends StatefulWidget {
  const WithdrawalCertificationPage({super.key});

  @override
  State<WithdrawalCertificationPage> createState() => _WithdrawalCertificationPageState();
}

class _WithdrawalCertificationPageState extends State<WithdrawalCertificationPage> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

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
                          'aaa@gmail.com',
                          style: AppTextStyle.body16R120.copyWith(
                            color: AppColors.f05,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 이메일 인증
                  _sectionCard(
                    title: '이메일 인증',
                    child: Column(
                      children: [
                        _bulletItem('안전한 탈퇴를 위해 이메일인증을 진행합니다.'),
                        _bulletItem('이메일로 발송된 6자리 코드를 입력해 주세요.'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 인증번호 입력
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _codeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '인증번호',
                                hintStyle: AppTextStyle.body16R120.copyWith(
                                  color: AppColors.f03,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: AppTextStyle.body16R120.copyWith(
                                color: AppColors.f05,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: 인증하기 로직
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            elevation: 0,
                          ),
                          child: Text(
                            '인증하기',
                            style: AppTextStyle.body16R120.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      minimumSize: const Size(151, 55),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      '이전',
                      style: AppTextStyle.body16R120.copyWith(
                        color: AppColors.f05,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: 탈퇴하기 로직
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const Oauth2LoginPage(),
                        ),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      side: BorderSide(color: AppColors.black, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(151, 55),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                    ),
                    child: Text(
                      '탈퇴하기',
                      style: AppTextStyle.body16R120.copyWith(
                        color: Colors.white,
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