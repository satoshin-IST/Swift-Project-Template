# Swift-Project-Template

`Skelton.swif`を実行してiOS用各種設定が構築済みのプロジェクトを生成できます。

## Features

- [x] 対話型でプロジェクト設定
- [x] 標準ライブラリ自動インストール(メイン:Carthage, サブ:CocoaPod)
- [x] SwiftLint
- [x] R-Swift
- [x] Push通知用モジュール
- [x] RealmSwift用モジュール
- [x] ビルド最適化(Optimization Level, Swift Other Flags)
- [x] xcconfig & schemeによる環境切り分け
- [ ] Jazzy
- [ ] Swagger
- [ ] Fastlane, EMLauncher
- [ ] Danger
- [ ] Peek
- [ ] Playground Driven Development
- [ ] FBSnapshotTestCase
- [ ] シェル実行時にプライバシー関連の質問でPlistを更新
- [ ] Bluetooth
- [ ] GoogleAnalytics
- [ ] Repro
- [ ] Sourcery

## 使い方

git clone

```shell
git clone git@github.com:satoshin-IST/Swift-Project-Template.git
```

Run `Skelton.swift` script

```swift
swift ./Skelton
```

Answer some questions:

<img src="readme-image.png" width="500"/>

We are done! Now start coding your app! 🍻🍻

## プロジェクト基本設定

**Targets指定漏れ対策やビルド時間短縮のため** 環境毎の設定は`Scheme & xcconfig`で行っています。

```
Xcode 9.2
Swift 4.0

- Targets
  ProjectTarget
  Tests
  UITests
  
- Scheme & xcconfig
  ProjectName-Debug: `Supporting Files/Config.Debug.xcconfig`
  ProjectName-Adhoc: `Supporting Files/Config.Adhoc.xcconfig`
  ProjectName-Release: `Supporting Files/Config.Release.xcconfig`
```

## ライブラリ基本設定

**ビルド速度向上のため** Carthageをメインとしています。

```
- ネットワーク
  Alamofire
  
- 非同期処理
  BrightFutures

- ユーティリティ
  SwiftLint
  R-Swift
  Device
  SwiftDate
  XLSwiftKit

- テスト
  Quick / Nimble 

- その他 
  Cartfileを参照して下さい
    (https://github.com/satoshin-IST/Swift-Project-Template/blob/develop/Project-iOS/XLProjectName/Cartfile) 
```
