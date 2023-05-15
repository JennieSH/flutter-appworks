import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ARKitController arkitController;

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    final node = ARKitNode(
      // geometry 定義節點的幾何形狀
      // (1) ARKitSphere 球體 (2) ARKitBox 立方體  (3) ARKitPlane 平面
      geometry: ARKitSphere(
        // materials 定義物體外觀和材質屬性
        materials: [
          ARKitMaterial(
            // diffuse（散射材質）：用於定義物體的顏色或圖片貼圖
            diffuse: ARKitMaterialProperty.image('assets/demo.webp'),

            // doubleSided（雙面顯示）：指定物體是否在正反兩面都顯示材質。true 雙面顯示；false 只顯示正面，背面顯示為透明或無顏色。
            doubleSided: true,

            // emission（自發光）：指定物體是否會自發光，以及自發光的顏色
            // emission: ARKitMaterialProperty.image('assets/newyork.webp'))

            // roughness（粗糙度）：指定物體的表面粗糙度，影響物體的反射和漫反射，範圍為 0(光滑) ~ 1(粗糙)
            // roughness: ARKitMaterialProperty.value(0.5),

            // transparent（透明度）：指定物體的透明度
            // transparent: ARKitMaterialProperty.value(0.8),
          )
        ],
        // 球體半徑
        radius: 1,
      ),
      // 代表 AR 世界中節點的位置
      position: Vector3(0, 0, 0),
    );

    this.arkitController.add(node);
  }

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('ARKit in Flutter')),
        body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
      );
}
