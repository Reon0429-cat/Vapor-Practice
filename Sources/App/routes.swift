import Vapor
import Leaf
import LeafKit

// アクセスするURLを設定することができる
func routes(_ app: Application) throws {
    
    // Viewsのindex.leafファイルをレンダリング
    // index.leafの#titleにHello Vapor!を入れている
    app.get("KKK") { request in
        return request.view.render("like", ["title": "Hello"])
    }
    
    // http://localhost:8080/AAA/BBB でアクセスするとCCCを返す
    // 「/」で区切るのはだめ
    app.get("AAA", "BBB") { request in
        return "CCC"
    }
    
    // URLの省略
    // http://localhost:8080/X/Y/Z でアクセスできる
    let appGrouped = app.grouped("ABC", "DEF")
    appGrouped.get("Z") { request in
        return "REON"
    }
    
    // :id, :nameなどとすることで引数を渡せる
    app.get("User", ":id", ":name") { request -> String in
        let id = request.parameters.get("id")
        let name = request.parameters.get("name")
        return "Hello, world!" + id! + name!
    }
    
}
