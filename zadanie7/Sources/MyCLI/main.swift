import Foundation
import Vapor
import Fluent
import FluentSQLiteDriver

func routes(_ app: Application) throws {
    try app.register(collection: ProductController())
}

do {
    var env = try Environment.detect()
    let app = Application(env)
    defer { app.shutdown() }
    let fm = FileManager.default
    let dbPath = fm.currentDirectoryPath + "/db.sqlite"
    if fm.fileExists(atPath: dbPath) {
        try fm.removeItem(atPath: dbPath)
    }
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.migrations.add(CreateProduct())
    try routes(app)
    try app.autoMigrate().wait()
    try app.run()

} catch {
    print("Error: \(error)")
    exit(1)
}