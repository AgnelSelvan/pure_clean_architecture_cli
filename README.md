## Pure Clean Architecture CLI

**pure_clean_architecture_cli** is a command line tool to generate folders and files based on **Clean Architecture**. This CLI also helps you to setup a project.

The folder structure this package follows is based on **feature by folder** type.

To use it, you should do the following:

- Activate *pure_clean_architecture_cli* dart cli globally
    ```terminal
    dart pub global activate pure_clean_architecture_cli
    ```
- Make sure you are on correct flutter project directory, and run this command on terminal.
    ```terminal
    dart pub global run pure_clean_architecture_cli
    ```

#### Features

This packages helps you to setup project and creates features folder and files based on clean architecture.

##### Setup New Flutter Project
- After running `dart pub global run pure_clean_architecture_cli` command in terminal, You need to select 1 option. This will help to create required files like, routes, themes, extensions, assets, api, etc inside **lib** folder
- This is how the folder structure looks like
    ```terminal
    lib
    ├── core
    │   ├── api
    │   │   └── api.dart
    │   ├── assets
    │   │   └── assets.dart
    │   ├── constants
    │   │   └── constants.dart
    │   ├── errors
    │   │   ├── exception.dart
    │   │   └── failure.dart
    │   ├── extension
    │   │   └── extension.dart
    │   ├── routes
    │   │   └── routes.dart
    │   ├── themes
    │   │   └── themes.dart
    │   ├── utils
    │   │   └── usecase.dart
    │   └── validator
    │       └── validator.dart
    └── main.dart
    ```
##### Create New Feature
- After running `dart pub global run pure_clean_architecture_cli` command in terminal, You need to select 2 option. This will help to create required folders and files based on Clean Architecture. Respective folders and files are created inside *features* folder.
- This is how the folder structure looks like
```
lib
├── features
│   └── upload_file
│       ├── data
│       │   ├── datasource
│       │   │   ├── upload_file_local_datasource.dart
│       │   │   └── upload_file_remote_datasource.dart
│       │   ├── models
│       │   │   └── upload_file_model.dart
│       │   └── repository
│       │       └── upload_file_repository.dart
│       ├── domain
│       │   ├── entity
│       │   │   └── upload_file_entity.dart
│       │   ├── repository
│       │   │   └── upload_file_repository.dart
│       │   └── usecase
│       │       ├── add_upload_file_usecase.dart
│       │       ├── delete_upload_file_usecase.dart
│       │       ├── get_a_upload_file_usecase.dart
│       │       ├── get_all_upload_file_usecase.dart
│       │       └── update_upload_file_usecase.dart
│       └── presentation
│           ├── manager
│           │   ├── upload_file_bloc.dart
│           │   ├── upload_file_event.dart
│           │   └── upload_file_state.dart
│           ├── pages
│           │   └── upload_file_page.dart
│           └── widgets
└──  main.dart
```

**NOTE: Enter feature name based on camelCase.**
Eg. If the Feature name is *Upload File* enter as *uploadFile*





