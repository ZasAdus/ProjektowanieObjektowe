import Vapor
import Fluent

struct ProductController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let productRoutes = routes.grouped("products")
        
        productRoutes.get(use: listAll)
        productRoutes.post(use: createProduct)
        
        productRoutes.group(":productID") { route in
            route.get(use: getProduct)
            route.put(use: updateProduct)
            route.delete(use: deleteProduct)
        }
    }

    func listAll(req: Request) throws -> EventLoopFuture<[Product]> {
        return Product.query(on: req.db).all()
    }

    func createProduct(req: Request) throws -> EventLoopFuture<Product> {
        let inputData = try req.content.decode(CreateProductData.self)
        let newProduct = Product(name: inputData.name, price: inputData.price)
        return newProduct.save(on: req.db).map { newProduct }
    }

    func getProduct(req: Request) throws -> EventLoopFuture<Product> {
        guard let idString = req.parameters.get("productID"), let uuid = UUID(uuidString: idString) else {
            throw Abort(.badRequest)
        }
        return Product.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    func updateProduct(req: Request) throws -> EventLoopFuture<Product> {
        let updateData = try req.content.decode(CreateProductData.self)
        guard let idString = req.parameters.get("productID"), let uuid = UUID(uuidString: idString) else {
            throw Abort(.badRequest)
        }
        return Product.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { product in
                product.name = updateData.name
                product.price = updateData.price
                return product.save(on: req.db).map { product }
            }
    }

    func deleteProduct(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        guard let idString = req.parameters.get("productID"), let uuid = UUID(uuidString: idString) else {
            throw Abort(.badRequest)
        }
        return Product.find(uuid, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { product in
                product.delete(on: req.db)
            }
            .transform(to: .noContent)
    }
}

struct CreateProductData: Content {
    let name: String
    let price: Double
}