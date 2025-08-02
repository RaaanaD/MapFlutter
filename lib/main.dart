import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            //listとMapの違い
            final List<int> scoreList = [50, 80, 70];
            scoreList[2];

            //Map ★var型でも可！
            // Map<String, int> scoreMap = {
            var scoreMap = <String, int> {
              "bb": 50,
              "a": 80,
              "ccc": 70,
            };
            //あたい,
            // valueの取得 ★変数[key];
            print(scoreMap['bb']);//50
            //要素を追加
            scoreMap['dddd'] = 100;
            print(scoreMap);
            //要素を削除 ★変数.remove(key);
            scoreMap.remove('ccc');
            print(scoreMap);
            //addAll MapとMapを結合 ★変数.addAll({新しく追加したいMap});
            scoreMap.addAll({'eee': 20, 'ff': 40});
            print(scoreMap);//  {bb: 50, a: 80, dddd: 100, eee: 20, ff: 40}
            //containsKey　キーが存在するか確かめる
            print(scoreMap.containsKey('sawada'));//false scoreMapにはsawadaというキーが含まれていないので

            //★ソート 並び替え
            //★★ compareToメソッド： 値と値を比べてより優れている場合は1,劣っている場合は-1,等しい場合は0の整数値を返す
            // scoreMap = SplayTreeMap.from(scoreMap,(a,b)=>a.compareTo(b));
            // print(scoreMap);// {a: 80, bb: 50, dddd: 100, eee: 20, ff: 40}
            // scoreMap = SplayTreeMap.from(scoreMap,(a,b)=>b.compareTo(a));
            // print(scoreMap);//{ff: 40, eee: 20, dddd: 100, bb: 50, a: 80}
            //keyの文字数の取得　比較 同文字数では
            // scoreMap = SplayTreeMap.from(
            //     scoreMap, (a, b) => b.length.compareTo(a.length));
            //★compareToメソッド： 値と値を比べてより優れている場合は1,劣っている場合は-1,等しい場合は0の整数値を返す
            // ※0が返されるとmapの要素が一つ消滅してしまうので、1に変える
            //Mapのソート対象に同値が含まれる可能性ある場合、以下を使って0を1にする
            scoreMap = SplayTreeMap.from(scoreMap, (a,b) {
              int compare = b.length.compareTo(a.length);
              return compare == 0 ? 1 : compare; //if分の略！！
            });
            print(scoreMap);// {dddd: 100, eee: 20, ff: 40, bb: 50, a: 80}
            //length　Mapに含まれる要素数の取得
            print(scoreMap.length);// 5　　要素数
            //keys / values
            print(scoreMap.keys.toList());//[dddd, eee, ff, bb, a]//keyのみ表示
            print(scoreMap.values.toList());//[100, 20, 40, 50, 80] //valueのみ表示
            //forEach　★繰り返し処理  //単純な反復処理
            scoreMap.forEach((key, value) {
              print('$keyと$valueを出力');
              //ddddと100を出力
              // eeeと20を出力
              // ffと40を出力
              // bbと50を出力
              // aと80を出力
            });
            //複雑な反復処理したい場合
            for(int i = 0; i < scoreMap.length; i++){
              //複雑な反復処理
              print(i);
            }
          },
        // onPressed: _incrementCounter,
        // tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
