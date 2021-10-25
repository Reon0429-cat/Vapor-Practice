import Leaf
import Vapor

// configures your application
// 使用するデータベースの設定やモデルを追加した場合に編集する
// Package.swiftで追加した機能もここで設定することで有効になる
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.views.use(.leaf)

    

    // register routes
    try routes(app)
}
