# Swift-Project-Template

`Skelton.swif`を実行してiOS用各種設定が構築済みのスケルトンプロジェクトを作成できます。

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


## プロジェクト構成

### プロジェクト基本設定

Targets指定漏れ対策やビルド時間短縮のために環境毎の設定は`Scheme & xcconfig`で行っています。

xcconfigファイルに環境変数を設定し対応するSchemeと紐付けています。

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

### ライブラリ基本設定

ビルド速度向上のためCarthageをメインとしています。

`R-Swift`, `SwiftLint`のみをCocoaPodでインストールしています。

```
- ネットワーク
  Alamofire
  
- 非同期処理
  BrightFutures

- ユーティリティ
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
