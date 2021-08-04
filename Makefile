.PHONY: clean
clean:
	rm -rf proto/helloworld/*.go
	rm -rf envoy/*.pb

.PHONY: protoc
protoc:
	protoc -I . \
	  -I $(GOPATH)/src/github.com/googleapis/googleapis \
	  --go_out . \
	  --go_opt paths=source_relative \
	  --go-grpc_out . \
	  --go-grpc_opt paths=source_relative \
	  --include_imports \
	  --include_source_info \
	  --descriptor_set_out=envoy/helloworld.pb \
	  proto/helloworld/helloworld.proto

.PHONY: envoy
envoy:
	docker run --rm \
	  -p 51051:51051 \
	  -v $(shell pwd)/envoy:/etc/envoy \
	  envoyproxy/envoy:v1.19-latest

