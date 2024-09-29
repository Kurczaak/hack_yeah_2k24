# Hack Yeah 2024 Krakow

## 🚴Welloway

<img width="300" alt="main" src="https://github.com/user-attachments/assets/df42c7ad-c08d-4183-b89d-c04d9cedb5f4">
<img width="300" alt="drawer" src="https://github.com/user-attachments/assets/9a5b3ef4-fdb9-4d82-81a9-0bb54789d73a">
<img width="300" alt="map" src="https://github.com/user-attachments/assets/20897856-d940-4047-bca3-429b4e3766dd">



## 🏛️ Architecture
![Architecture][architecture]

This project utilizes clean architecture principles.

### Data Layer
The outermost layer that is responsible for communicating with harsh, real world

### Domain Layer
The pristine center of the app. Here, business logic of the app takes place

### Presentation Layer
The layer a user interacts with

---

## 🪛 Developer's set-up

#### 🎯 Install dependencies

`flutter pub get`

#### 🧱 Activate and initialize mason

`dart pub global activate mason_cli`

`mason init`

#### 🍈 Activate and initialize melos

`dart pub global activate melos`

`melos bootstrap`

#### 🔨 Build the app

`melos run builder`

## 📝 Useful snippets

#### Run build runner

`melos run builder`

#### Add new feature

`mason make flutter_bloc_feature -o lib/presentation/feature`

#### Add new model

`mason make model`

---

## 🚀 Getting Started

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Hack Yeah 2k24 works on iOS and Android._

---

## 🌐 Working with Translations

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:hack_yeah_2k24/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
    <array>
        <string>en</string>
        <string>es</string>
    </array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Generating Translationsś

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.


[architecture]: https://i.ibb.co/fr9qwF4/architecture-drawio.png
