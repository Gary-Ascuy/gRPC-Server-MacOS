# MacOS - gRPC Service 

Create New App 
```sh
swift package init --name MyClientApp --type executable
```

### Local Development 

Install protobuf
```sh
brew install protobuf swift-protobuf protoc-gen-grpc-swift
```

Test Protoc Path - it should be used in config file for project
```sh
/opt/homebrew/bin/protoc --version
```

Build Application - It generates protocols with protoc config [HERE](https://github.com/Gary-Ascuy/gRPC-Server-MacOS/blob/main/Sources/Protos/grpc-swift-proto-generator-config.json#L8) 
```sh
swift build
```

Start Service
```sh
swift run
```
