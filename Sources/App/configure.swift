import Leaf
import Vapor
import FluentSQL
import FluentPostgresDriver
import Fluent
import FluentKit

// configures your application
// 使用するデータベースの設定やモデルを追加した場合に編集する
// Package.swiftで追加した機能もここで設定することで有効になる
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.views.use(.leaf)
    app.databases.use(.postgres(hostname: "localhost",
                                username: "oonishireon",
                                password: "0429Reon",
                                database: "address"),
                      as: .psql)
    app.migrations.add(Book(), to: .psql)
    // register routes
    try routes(app)
}
