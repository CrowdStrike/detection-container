# CrowdStrike Docker Detection Container

[![Container Repository on Quay](https://quay.io/repository/crowdstrike/detection-container/status "Container Repository on Quay")](https://quay.io/repository/crowdstrike/detection-container)

This container will create detections and preventions on a Linux container protected by a CrowdStrike sensor.

Automated detections currently available include:

* Defense Evasion via Masquerading
* Defense Evasion via Rootkit
* Execution via Command-Line Interface
* Exfiltration Over Alternative Protocol
* Command & Control via Remote Access Protocol *
* Collection via Automated Collection
* Credential Access via Credential Dumping
* Malware - Linux Trojan *
* Webserver Suspicious Terminal Spawn
* Webserver Unexpected Child of Web Service
* Webserver Bash Reverse Shell *
* Webserver Trigger Metasploit Payload **

(*) eligible for Prevention if configured in policy
(**) container starting using exposed port (-p 8080:80) required and a Kali attack host ready. Note a detection will only occur once you execute commands via meterpreter!

# Downloading & Usage

## Download via Quay.io
Container images hosted at [https://quay.io/repository/crowdstrike/detection-container](https://quay.io/repository/crowdstrike/detection-container) are automatically rebuilt with every merged pull request. Pull this container with the following Docker (or podman!) command:

Using Docker CLI:
```
$ docker pull quay.io/crowdstrike/detection-container
```

Using Podman CLI:
```
$ podman pull quay.io/crowdstrike/detection-container
```

## Build from Source
Clone this repository and build the container using ``docker build`` or ``podman build``:

With Docker CLI:
```
docker build -t <your_repository>/detection-container .
```

Podman CLI:
```
podman build -t <your_repository>/detection-container .
```

# Generate Sample Detections
The detection-container can used in one of two modes:

1. ``interactive`` mode, which will expose a TUI where you can select pre-canned scripts that will generate simple detections (e.g., "hit #1 for credential dumping!"). 

2. ``non-interactive`` mode, which will randomly create detections. This is how CrowdStrike runs the detection-container internally as it will constantly create sample detections for product demos.

## Interactive Mode
The following command will utilize Docker's interactive mode, present you with a text-based interface, and remove the container from your system after running:

```
$ sudo docker run --rm -it quay.io/crowdstrike/detection-container
```

This will present a text user interface:
![detection-container Text User Interface](docs/images/cli-interface.png)

Enter the menu option of the detection you would like to create and hit enter. Depending on which detection was selected you may be guided through additional menus.

## Non-interactive Mode
Non-interactive mode will randomly create detections. Between each detection the container will pause for a randomized amount of time ranging from 100 to 1800 seconds (roughly 1.5 - 30 minutes). This pause ensures events trigger unique detections in the Falcon console that are not grouped together.

The following command will run detection-container non-interactively:
```
$ sudo docker run --rm quay.io/crowdstrike/detection-container
```

Output will be sent to the console (via ``stdout``) regarding what detections are being generated. An example of running in non-interactive mode, plus output, is shown below:

![non-interactive mode](docs/images/non-interactive.png)
