# CrowdStrike Docker Detection Container

[![Container Repository on Quay](https://quay.io/repository/crowdstrike/detection-container/status "Container Repository on Quay")](https://quay.io/repository/crowdstrike/detection-container)

This container will create detections and preventions only on Linux hosts, container platforms (e.g. OpenShift), and containers themselves, which are protected by a CrowdStrike sensor.

Automated detections currently available include:

| Name | Description |
|:-----|:------------|
| [Defense Evasion via Rootkit](https://github.com/CrowdStrike/detection-container/blob/main/bin/Defense_Evasion_via_Rootkit.sh) | This script will change the group owner of `/etc/ld.so.preload` to `0`, indicative of a Jynx Rootkit. |
| [Execution via Command-Line Interface](https://github.com/CrowdStrike/detection-container/blob/main/bin/Execution_via_Command-Line_Interface.sh) | Emulate malicious activity related to suspicious CLI commands. Runs the command `sh -c whoami '[S];pwd;echo [E]'`.|
| [Exfiltration Over Alternative Protocol](https://github.com/CrowdStrike/detection-container/blob/main/bin/Exfiltration_via_Exfiltration_Over_Alternative_Protocol.sh) | Attempts to exfiltrate data using DNS dig requests that contain system data in the hostname. |
| [Command & Control via Remote Access Protocol](https://github.com/CrowdStrike/detection-container/blob/main/bin/Command_Control_via_Remote_Access.sh) \* | Attempts to connect to a remote IP address and will exit at fork. Falcon Prevent will kill the attempt. |
| [Collection via Automated Collection](https://github.com/CrowdStrike/detection-container/blob/main/bin/Collection_via_Automated_Collection.sh) | Attempts to dump credentials from `/etc/passwd` to `/tmp/passwords`. |
| [Credential Access via Credential Dumping](https://github.com/CrowdStrike/detection-container/blob/main/bin/Credential_Access_via_Credential_Dumping.sh) | Runs mimipenguin and tries to dump passwords from inside the container environment. |
| [Webserver Suspicious Terminal Spawn](https://github.com/CrowdStrike/detection-container/blob/main/bin/Webserver_Suspicious_Terminal_Spawn.sh) | Executes a command injection, which writes a file to local webserver then executes that script. |
| [Webserver Unexpected Child of Web Service](https://github.com/CrowdStrike/detection-container/blob/main/bin/Webserver_Unexpected_Child_of_Web_Service.sh) |Executes command injection to dump MySQL Server tables of database running inside the detection container. |
| [Webserver Bash Reverse Shell](https://github.com/CrowdStrike/detection-container/blob/main/bin/Webserver_Bash_Reverse_Shell.sh) \* | Executes command injection that creates a reverse shell over the web server running in the detection container. |
| [Webserver Trigger Metasploit Payload](https://github.com/CrowdStrike/detection-container/blob/main/bin/metasploit/Webserver_Trigger_Metasploit_Payload.sh) \*\* | Simulates a malicious file upload, which executes a reverse TCP meterpreter to Kali. Please review the script for details on how to trigger this detection. |
| [Reverse TCP Trojan (inert)](https://github.com/CrowdStrike/detection-container/blob/main/bin/Reverse_Shell_Trojan.sh) \* | Inert Trojan, written by CrowdStrike, that will attempt to connect to 192.168.0.1 on TCP port 4444. Tnis will be detected and killed by CrowdStrike's on-sensor machine learning with the aggressive policy settings. |

> [!NOTE]
> (**\***) eligible for Prevention if configured in policy
>
> (**\*\***) container starting using exposed port (-p 8080:80) required and a Kali attack host ready. Please note that a detection will only occur once you execute commands via meterpreter!

## Downloading & Usage

### Download via Quay.io

Container images hosted at [https://quay.io/repository/crowdstrike/detection-container](https://quay.io/repository/crowdstrike/detection-container) are automatically rebuilt as mult-architecture images with every merged pull request. Pull this container with the following Docker (or podman!) command:

Using Docker CLI:

```shell
docker pull quay.io/crowdstrike/detection-container
```

Using Podman CLI:

```shell
podman pull quay.io/crowdstrike/detection-container
```

If a specific architecture is desired to be used, add the `--platform` flag with the desired architecture(s): `linux/arm64,linux/amd64,linux/s390x,linux/ppc64le`

### Build from Source

Clone this repository and build the container using ``docker build`` or ``podman build``:

With Docker CLI:

```shell
docker build -t <your_repository>/detection-container .
```

Podman CLI:

```shell
podman build -t <your_repository>/detection-container .
```

Multi-architecture Build (requires Docker with BuildKit):

```shell
make docker-buildx
```

## Generate Sample Detections

The detection-container operates in one of two modes, suitable for both Docker and Kubernetes environments:

### Interactive Mode

This mode exposes a text-based user interface (TUI) for selecting pre-canned scripts to generate simple detections (e.g., "hit #1 for credential dumping!").

An example of running in interactive mode is shown below:

<img src="docs/images/cli-interface.png" alt="detection-container Text User Interface" width=600 height=500>

For Docker, use the following command to run the detection container interactively:

```bash
sudo docker run --rm -it quay.io/crowdstrike/detection-container
```

For Kubernetes environments, refer to the [vulnapp project](https://github.com/CrowdStrike/vulnapp) for running the detection container interactively.

### Non-interactive Mode

In this mode, detections are randomly generated with pauses between each to ensure uniqueness in the Falcon console. The pause duration ranges from 100 to 1800 seconds (approximately 1.5 to 30 minutes).

Output will be sent to the console (via ``stdout``) regarding what detections are being generated. An example of running in non-interactive mode, plus output, is shown below:

<img src="docs/images/non-interactive.png" alt="non-interactive mode" width="700" height="500">

For Docker, use the following command to run the detection container non-interactively:

```bash
sudo docker run --rm quay.io/crowdstrike/detection-container
```

For Kubernetes environments, use the following command to run the detection container non-interactively:

```bash
kubectl create -f https://raw.githubusercontent.com/CrowdStrike/detection-container/main/detections.example.yaml
```
