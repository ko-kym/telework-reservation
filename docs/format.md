# formatをVscodeで適応したい

## .vscodeの中身を確認
    ```
    koko@koko:~/workspace/java/telework-reservation/.vscode$ tree .
    .
    ├── jsp.code-snippets
    ├── launch.json
    └── settings.json ← Vscodeの設定ファイル

    0 directories, 3 files

        5 directories, 19 files
    ```

### .vscode/settings.json
```json
{
    "java.configuration.updateBuildConfiguration": "interactive",
    "sqltools.connections": [
        {
            "previewLimit": 50,
            "server": "localhost",
            "port": 5432,
            "driver": "PostgreSQL",
            "name": "postgres-in-wsl",
            "database": "teleworkreservations",
            "username": "postgres",
            "password": "postgres"
        }
    ]
}
```

- postgresの設定はどこを反映していますか？
    - SQLTools！！
- formatも同じように。。。

## 手順
- Alt + Shift + f
- configure ← 初めてのActionの時 ファイル単位
- formatterを選択