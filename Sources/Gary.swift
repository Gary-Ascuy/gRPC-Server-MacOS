// The Swift Programming Language
// https://docs.swift.org/swift-book
import GRPCCore
import GRPCNIOTransportHTTP2
import GRPCProtobuf

@main
struct Gary { 
   static func main() async throws {
      print("Staring service ...")
      
      let server = GRPCServer(
        transport: .http2NIOPosix(
          address: .ipv4(host: "127.0.0.1", port: 49151),
          transportSecurity: .plaintext
        ),
        services: [Executor(), Loader()]
      )

      try await withThrowingDiscardingTaskGroup { group in
        group.addTask { try await server.serve() }
        if let address = try await server.listeningAddress {
          print("Start listening on \(address)")
        }
      }
  }
}

struct Executor: Neko_Executor.SimpleServiceProtocol {
  func execute(request: Neko_NekoRequest, context: ServerContext) async throws -> Neko_NekoResponse {
    var reply = Neko_NekoResponse()
    reply.message = "Load, \(request.name.isEmpty ? "Stranger" : request.name)"
    return reply
  }
}

struct Loader: Neko_Loader.SimpleServiceProtocol {
  func load(request: Neko_NekoRequest, context: ServerContext) async throws -> Neko_NekoResponse {
    var reply = Neko_NekoResponse()
    reply.message = "Load, \(request.name.isEmpty ? "Stranger" : request.name)"
    return reply
  }
}
