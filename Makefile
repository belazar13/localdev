GO_ARCH?=go1.12.14.linux-amd64.tar.gz
PROTOBUF_VERSION?=3.11.2

start_mongo:
	docker-compose up -d mongodb

start_percona:
	docker-compose up -d percona

start_pma:
	docker-compose up -d pma

start_postgres:
	docker-compose up -d postgres

download_go:
	wget https://dl.google.com/go/${GO_ARCH}

extract_go:
	sudo tar -C /usr/local -xzf ${GO_ARCH}

add_go_to_profile:
	echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

install_go: download_go extract_go add_go_to_profile
	echo "Done"

create_global_git_ignore:
	git config --global core.excludesfile ~/.gitignore

start_jaeger:
	docker run -d --name jaeger \
      -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
      -p 5775:5775/udp \
      -p 6831:6831/udp \
      -p 6832:6832/udp \
      -p 5778:5778 \
      -p 16686:16686 \
      -p 14268:14268 \
      -p 9411:9411 \
      jaegertracing/all-in-one:latest

install_protobuf:
	echo "Check newest version: https://github.com/protocolbuffers/protobuf/releases/"
	echo "Install protobuf, version: [${PROTOBUF_VERSION}]"
	cd /tmp
	curl -OL https://github.com/google/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip
	unzip protoc-${PROTOBUF_VERSION}-linux-x86_64.zip -d protoc3
	sudo mv protoc3/bin/* /usr/local/bin/
	sudo mv protoc3/include/* /usr/local/include/
	echo "Install protobuf plugins"
	go get -u -v github.com/golang/protobuf/protoc-gen-go
	go get -u -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
