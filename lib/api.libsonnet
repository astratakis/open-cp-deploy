local k = import "k.libsonnet";

local deploy = k.apps.v1.deployment;
local container = k.core.v1.container;
local containerPort = k.core.v1.containerPort;


{
    generate(): {

        deployment: deploy.new(
            name="flask-api",
            replicas=1,
            containers=[
                local image = "petroud/profvisualizer:latest";
                container.new("apiserver", image)
                + container.withImagePullPolicy("Always")
                + container.withArgs(
                    [
                        "access123key",
                        "secret123key",
                        "mytoken132213",
                        "https://minio.stelar.gr",
                        "s3://bucket-name/hello-world.txt",
                        "23421341234123",
                        "signature123",
                        "klms.stelar.gr",
                        "/"
                    ]
                )
                + container.withPorts([
                    containerPort.newNamed(8080, "http")
                ])
            ]
        )
    }
}