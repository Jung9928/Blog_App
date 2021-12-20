import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // form상태를 관리하는 key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funValidator: validateTitle(),
                value: "제목1~" * 2,
              ),
              CustomTextArea(
                hint: "Content",
                funValidator: validateContent(),
                value: "내용1" * 20, // 서버에서 받아올 데이터
              ),
              // HomePage -> DetailPage
              CustomElevatedButton(
                text: "글 수정하기",
                funPageRoute: () {
                  // !를 사용하여 절대 null값이 될 수 없음을 지정. 그리고 버튼 클릭 시, validate가 실행되어 value값에 입력한 값이 저장.
                  if (_formKey.currentState!.validate()) {
                    // 유효성 검증을 통과하면 이동.
                    Get.back(); // Get.back()은 상태변경이 적용되지 않기 때문에 상태 관리 GetX 라이브러리의 Observer를 사용해서 데이터 갱신을 할 것임.
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
