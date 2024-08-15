# docker

### docker-postgres
- currentディレクトリに`docker-compose.yml`があるか確認
- ` docker -v` : 
    > Docker version xx.x.x, build xxxxxxx
- ` docker-compose -v` : 
    > Docker Compose version v2.xx.x-desktop.1
- ` docker-compose up -d` : コンテナの作成
- ` docker-compose down` : コンテナの削除
  - 削除後は `.docker/postgres` に設定やデータが残っている
    - rootユーザーで確認が可能