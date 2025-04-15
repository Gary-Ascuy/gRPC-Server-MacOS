# MacOS - gRPC Service 

### Local Development 

Install protobuf
```sh
brew install protobuf swift-protobuf protoc-gen-grpc-swift
```

Test Protoc Path - it should be used in config file for project
```sh
/opt/homebrew/bin/protoc --version
```

Build Application - It generates protocols with protoc
```sh
swift build
```

Start Service
```sh
swift run
```
