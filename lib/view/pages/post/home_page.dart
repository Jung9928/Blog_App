import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info.dart';
import 'package:get/get.dart';

import 'detail_page.dart';
import 'write_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // put : 없으면 만들고, 있으면 찾음
    UserController u = Get.find(); // 싱글톤으로 구현되어있음.

    // 객체 생성(creaet), onInit함수 실행(initialize)
    PostController p = Get.put(PostController());
    // p.findAll();

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${u.isLogin}"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: p.posts.length,
          itemBuilder: (context, index) {
            // index는 widget을 그려줄 때마다 카운트한 값을 화면에 숫자로 그려줌.
            return ListTile(
              onTap: () {
                Get.to(DetailPage(index), arguments: "argumetns 속성 테스트");
              },
              title: Text("${p.posts[index].title}"),
              leading: Text("${p.posts[index].id}"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        // SafeArea를 사용해서 앱화면 최상단 상태창보다 아래에 위젯이 위치하게함.
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Divider(), // 옅은 선 표시
              TextButton(
                onPressed: () {
                  Get.to(UserInfo());
                },
                child: Text(
                  "회원정보 보기",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Divider(), // 옅은 선 표시
              TextButton(
                onPressed: () {
                  u.logout();
                  Get.to(LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Divider(), // 옅은 선 표시
            ],
          ),
        ),
      ),
    );
  }
}
