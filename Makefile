.PHONY: clean
clean:
	rm -rf proto/helloworld/*.go

.PHONY: protoc
protoc:
	protoc -I . \
	  -I $(GOPATH)/src/github.com/googleapis/googleapis \
	  --go_out . \
	  --go_opt paths=source_relative \
	  --go-grpc_out . \
	  --go-grpc_opt paths=source_relative \
	  proto/helloworld/helloworld.proto
