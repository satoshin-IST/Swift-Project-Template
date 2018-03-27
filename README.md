# Swift-Project-Template

`Skelton.swif`を実行してiOS用各種設定が構築済みのスケルトンプロジェクトを作成できます。

## プロジェクト構成

* Targets
  * ProjectTarget: ヒューマンエラーを除去するためにTargetは一つです。
  * Tests: 
  * UITests:

* Scheme & XCConfig
  * ProjectName-Debug: `Supporting Files/Config.Debug.xcconfig`
  * ProjectName-Adhoc: `Supporting Files/Config.Adhoc.xcconfig`
  * ProjectName-Release: `Supporting Files/Config.Release.xcconfig`

* Build Settings
  * Swift 4.0
  * R-Swift
  * Swift Lint
  * Carthage, CocoaPod: ビルド速度向上のためCarthageメインです
  * Warnings for TODO and FIXME comments.
  
* ネットワーク
  * Alamofire
  
* 非同期処理
  * BrightFutures

* ユーティリティ
  * [Cartfile](https://github.com/satoshin-IST/Swift-Project-Template/blob/develop/Project-iOS/XLProjectName/Cartfile)を参照

* テスト
  * Quick / Nimble 

* その他 オプション (デフォルトではコメントアウト)
  * PushNotification Module
  * RealmSwift Module


##### Usage

Clone the repository:

```shell
git clone git@github.com:xmartlabs/Swift-Project-Template.git
```
Run `shell.swift` script from there:

```swift
swift -target x86_64-apple-macosx10.11 Swift-Project-Template/shell.swift
```

Answer some questions:

<img src="readme-image.png" width="500"/>

We are done! Now start coding your app! 🍻🍻
