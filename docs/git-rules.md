# GitのMy運用

- main ⇒ something branch 何かのブランチに必ずチェックアウト
    - add , commit
        - 間違えたりして一個戻りたいときは下記
            - `git reset --soft HEAD~1`
    - リモートに変更を反映
        - `git push` 
            - この時にリモートにブランチにない場合はエラーになるので、吐き出されたコマンドをコピー　例は下記
                ```PS C:\telework-reservation> git push
                    fatal: The current branch feature/add-git-rules-docs has no upstream branch.
                    To push the current branch and set the remote as upstream, use

                        git push --set-upstream origin feature/add-git-rules-docs

                    To have this happen automatically for branches without a tracking
                    upstream, see 'push.autoSetupRemote' in 'git help config'.```
            - `git push --set-upstream origin feature/add-git-rules-docs`
            - 上記コマンドで次から` git push`で可能
    - prを作る
        - 説明文
            - 説明文を作るために変更をファイルに吐き出す コマンドは下記
                - `git diff HEAD~1 > patch.txt`
            - ChatGPTに説明文を作ってもらう
        - 変更
            - `git diff --name-status HEAD~1`
        - リファレンス
            - 参照したURLを描く
    - merge

```
## Description

Please include a summary of the change and which issue is fixed. Please also include relevant motivation and context. List any dependencies that are required for this change.

## Changes

## Reference

[original template](
https://github.com/embeddedartistry/templates/blob/master/oss_docs/PULL_REQUEST_TEMPLATE/pull_request_template.md
) ```