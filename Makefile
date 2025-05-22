PLATFORMS := linux_amd64 linux_arm64 darwin_amd64 darwin_arm64 windows_amd64
FILENAME = main.go
OUTPUT_DIR := build
APPNAME := hello_app
IMAGE_TAG := rasko1988/hello_app:v1.0.0


format:
	gofmt -s -w ./app

run:
	go run app/${FILENAME}

define build_template
$(1):
	GOOS=$(word 1,$(subst _, ,$(1))) GOARCH=$(word 2,$(subst _, ,$(1))) \
	cd app && go build -o ../$(OUTPUT_DIR)/$(APPNAME)_$(1) .
endef

$(foreach platform,$(PLATFORMS),$(eval $(call build_template,$(platform))))


all: $(PLATFORMS)

clean:
	rm -rf $(OUTPUT_DIR)
	docker rmi -f $(IMAGE_TAG) || true
	
build:
	docker build -t $(IMAGE_TAG) .