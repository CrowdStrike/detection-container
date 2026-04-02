# Evil Binaries - Multi-Architecture Test Samples

This directory contains inert test binaries used for CrowdStrike Falcon detection testing.

## Files

- **sample** - Original 32-bit x86 inert trojan (legacy)
- **sample.c** - Source code for the inert trojan
- **sample-arm64** - ARM64/aarch64 Linux binary
- **Linux_Malware_High** - x86_64 test sample (separate test case)

## What the Test Binary Does

The `sample` binaries are **inert test tools** that:
1. Attempt to create a TCP connection to 192.168.0.1 on port 444
2. Are designed to trigger CrowdStrike Falcon's on-sensor machine learning detection
3. Do NOT contain any actual malicious code or payloads
4. Exit immediately (either blocked by Falcon or due to connection failure)

## Building Multi-Architecture Binaries

To build binaries for all supported architectures:

```bash
cd bin/evil
make all
```

To build for a specific architecture:

```bash
make arm64    # Build for ARM64/aarch64
make amd64    # Build for x86_64
```

Requirements:
- Podman (or Docker with buildx)
- Multi-architecture emulation support (QEMU)

## Cleaning Up

To remove all generated binaries:

```bash
make clean
```

## Note

These are **legitimate security testing tools** used by CrowdStrike for detection validation. They are not actual malware and contain no harmful code.
