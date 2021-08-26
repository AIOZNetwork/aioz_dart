![](.img/cover.png)

[![](https://img.shields.io/badge/docs-online-brightgreen)](https://aioznetwork.github.io/aioz_dart/)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/AIOZNetwork/aioz_dart/Test)](https://github.com/AIOZNetwork/aioz_dart/actions)
[![Codecov branch](https://img.shields.io/codecov/c/github/AIOZNetwork/aioz_dart/main)](https://codecov.io/gh/AIOZNetwork/aioz_dart/branch/main)
[![Pub Version](https://img.shields.io/pub/v/aioz_dart)](https://pub.dev/packages/aioz_dart)
[![](https://img.shields.io/badge/cosmos-stargate-blueviolet)](https://github.com/cosmos/cosmos-sdk/releases)
[![](https://img.shields.io/badge/compatible-flutter-blue)](https://flutter.dev)
[![GitHub](https://img.shields.io/github/license/AIOZNetwork/aioz_dart)](https://github.com/AIOZNetwork/aioz_dart/blob/main/LICENSE)

aioz_dart is a pure Dart package allowing you to easily integrate your Dart-based project with AIOZ Network blockchain.  

You can find the documentation on the [official website](https://aioznetwork.github.io/aioz_dart/). 

## Cosmos-SDK compatibility table
Over time, we developed different versions of this library to be compatible with multiple Cosmos SDK releases. Following you can find the compatibility table that indicates which version you should use: 

| Cosmos SDK version(s) | aioz_dart branch | 
| :-------------------: | :--------------: |
| `v0.40.x`, `v0.41.x`, `v0.42.x` | `main` |

## Getting started
To start using this library inside your project, just edit your `pubspec.yml` file adding the following lines: 

```yaml
dependencies:
  aioz_dart: <version>
```

The latest available version is:  
![Pub Version](https://img.shields.io/pub/v/aioz_dart)

You can even use a specific GitHub tag or branch if you want: 

```yaml
dependencies:
  aioz_dart:
    git:
      url: git://github.com/AIOZNetwork/aioz_dart.git
      ref: <branch or tag>
```
