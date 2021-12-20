import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'update_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments; // homePage에서 list 클릭 시, 넘어오는 arguments 데이터를 String으로 받겠다.

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "글 제목!!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          Divider(),
          Row(
            // 버튼을 가로로 배치하기 위해 Row 사용.
            children: [
              ElevatedButton(
                onPressed: () {
                  // Get.to를 사용하면 새로운 HomePage 인스턴스를 만들어서 이동하게 됨.
                  // appbar에 있는 뒤로가기 버튼을 누르면 히스토리를 사용하므로 GetX를 활용한 상태관리(즉, 변화에 대한 갱신 적용)가 안될 수 있다.
                  // 근데 Get. 시리즈 어떤 것을 사용하더라도 GetX로 상태관리 하면 됨.
                  Get.off(HomePage());
                },
                child: Text("삭제"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Get.to(UpdatePage());
                },
                child: Text("수정"),
              ),
            ],
          ),
          // 글 내용이 길어지면 앱화면 아래에 overflow가 발생할 수 있으므로 single~위젯 사용하고
          // 높이를 잡아주기 위해 Expanded 사용.
          Expanded(
            child: SingleChildScrollView(
              child: Text("글 내용!!" * 500),
            ),
          ),
        ]),
      ),
    );
  }
}
