# Makefile for building multi-architecture test binaries
# These are inert test samples for CrowdStrike Falcon detection testing

.PHONY: all clean arm64 amd64

all: arm64 amd64

# ARM64 / aarch64
arm64: sample-arm64

sample-arm64: sample.c
	@echo "Building sample-arm64 (Linux ARM64)..."
	podman run --rm --platform linux/arm64 \
		-v "$$(pwd)":/work:z -w /work \
		registry.access.redhat.com/ubi9/ubi \
		sh -c "dnf install -y gcc glibc-static > /dev/null && gcc -o sample-arm64 sample.c -static -O2 -Wall"
	@echo "Built: sample-arm64"

# AMD64 / x86_64 (maintains original binary name)
amd64: sample

sample: sample.c
	@echo "Building sample (Linux x86_64)..."
	podman run --rm --platform linux/amd64 \
		-v "$$(pwd)":/work:z -w /work \
		registry.access.redhat.com/ubi9/ubi \
		sh -c "dnf install -y gcc glibc-static > /dev/null && gcc -o sample sample.c -static -O2 -Wall"
	@echo "Built: sample"

clean:
	rm -f sample-arm64 sample
	@echo "Cleaned all architecture-specific binaries"
