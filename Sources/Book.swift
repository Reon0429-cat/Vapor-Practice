import Foundation
import Vapor
import FluentPostgresDriver
import FluentSQL
import FluentPostgreSQL
import PostgresKit
import FluentKit

// Content ... このモデルが構成要素であることを示す
// PostgreSQLModel ... このDBに保存することを示す
struct Book: Content, PostgresDatabase {
    var id: Int?
    var phoneNumber: String?
    var address: String?
    
    init(phoneNumber: String, address: String) {
        self.phoneNumber = phoneNumber
        self.address = address
    }
    
}

extension Book: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database
            .schema("Book") // 4
            .id() // 5
            .field("id", .int, .required)
            .field("phoneNumber", .string, .required) // 6
            .field("address", .string, .required)
            .create() // 8
    }
    
    // 9
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("Book").delete()
    }
    
}

// 参考: https://www.raywenderlich.com/23848990-database-migrations-with-vapor#toc-anchor-005
//4: Provide the schema of the database model.
//5: Create the id for the model.
//6: Add a field for the name of the Tool.
//7: Create the two timestamps for Tool — createdAt and updatedAt.
//8: Create the table.
//9: Add the required method, func revert(on:) -> EventLoopFuture. Inside, call the .delete() method on the Tool table.

//4: データベースモデルのスキーマを提供します。
//5: モデルのIDを作成します。
//6: ツール名のフィールドを追加します。
//7: ツールの2つのタイムスタンプ（createdAtとupdatedAt）を作成します。
//8: テーブルを作成します。
//9: 必要なメソッドfuncrevert（on：）-> EventLoopFutureを追加します。内部で、ツールテーブルの.delete（）メソッドを呼び出します
