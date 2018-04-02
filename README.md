# Swift-Project-Template

`Skelton.swif`を実行してiOS用各種設定が構築済みのプロジェクトを生成できます。

<p align="left">
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<img src="https://img.shields.io/badge/Swift%204.0-compatible-brightgreen.svg?style=flat" alt="Swift 4 compatible" />
<img src="https://img.shields.io/badge/Deployment%20Target-10.0%E3%80%9C-orange.svg?style=flat" alt="Deployment Target" />
<img src="https://img.shields.io/badge/Xcode-9.2-blue.svg?style=flat" alt="Xcode" />
</p>

## TODO

- [x] 対話型でプロジェクト設定
- [x] 標準ライブラリ自動インストール(メイン:Carthage, サブ:CocoaPod)
- [x] SwiftLint
- [x] R-Swift
- [x] Push通知用モジュール
- [x] RealmSwift用モジュール
- [x] ビルド最適化(Optimization Level, Swift Other Flags)
- [x] xcconfig & schemeによる環境切り分け
- [x] HTTPレスポンスヘッダの有効期限に従う画像ローダーのキャッシュ設定
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

## ライブラリ

**ビルド速度向上のため** Carthageをメインとしています。

デフォルト以外を導入する場合は `Cartfile/Podfile` を適宜設定して下さい。

| ジャンル | ライブラリ名 | Carthage or Cocoapod | デフォルト | 備考 | 
| :-: | :-: | :-: | :-: | :-: | 
| ユーティリティ (typo除去) | [R-Swift](https://github.com/mac-cain13/R.swift) | pod | ◯ | | 
| 静的解析ツール | [SwiftLint](https://github.com/realm/SwiftLint) | pod | ◯ | | 
| 通信クライアント | [Alamofire](https://github.com/Alamofire/Alamofire) | carthage | ◯ | | 
| 画像ローダー | [Nuke](https://github.com/kean/Nuke) | carthage | ◯ | [カスタムのURLCache](https://github.com/satoshin-IST/Swift-Project-Template/blob/develop/Project-iOS/XLProjectName/XLProjectName/Helpers/ImageLoader/Cache/MoreCache.swift)を利用 | 
| テスト | [Quick](https://github.com/Quick/Quick) | carthage | ◯ | | 
| テスト | [Nimble](https://github.com/Quick/Nimble) | carthage | ◯ | | 
| ユーティリティ | [Swift-Date](https://github.com/malcommac/SwiftDate) | carthage  | ◯ | | 
| ユーティリティ | [Device](https://github.com/Ekhoo/Device) | carthage  | ◯ | | 
| 位置情報 | [SwiftLocation](https://github.com/malcommac/SwiftLocation) | carthage  | | | 
| ファイル保存 | [Disk](https://github.com/saoudrizwan/Disk) | carthage  | | | 
| キーチェーン | [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) | carthage  | | | 
| Push通知 | [ncmb_ios](https://github.com/NIFCloud-mbaas/ncmb_ios) | carthage  | | | 
| Push通知(他) | [Firebase](https://github.com/firebase/firebase-ios-sdk) | pod  | | | 
| Push通知(他) | [aws/aws-sdk-ios](https://github.com/aws/aws-sdk-ios) | carthage  | | | 
| DB | [RealmSwift](https://realm.io/docs/swift/latest) | carthage  | | | 
| UI(ローディングインジケータ) | [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView) | carthage  | ◯ | デザイン要確認 | 
| 非同期処理 | [BrightFutures](https://github.com/Thomvis/BrightFutures) | carthage  | ◯ |  | 
| リアクティブ | [RxSwift](https://github.com/ReactiveX/RxSwift) | carthage  | |  | 
