# Crowdstrike Docker Detection Container

This container will create detections/preventions on a Linux protected by CrowdStrike sensor

# Prerequisites

To use this Detection Container you use a supported Linux image with docker and the Falcon sensor installed. Short description is below.

Install Docker CE in your Linux host
```
https://docs.docker.com/engine/install/
```
Install sensor and check Reduced Functionality Mode (RFM) status to verify kernel is fully supported (should return False)
```
sudo /opt/CrowdStrike/falconctl -g --rfm-state
```

## Building
Build the container using a command such as 
```
docker build -t <repository>/cs_centos .
```

## Use your container

Start test container (sudo may be required, initial run requires some download time) adding interactive mode and remove container after exit.
```
docker run --rm -it <repository>/cs_centos
```
Select on ption from the menu to run and check detections in dashboard
Exit container ( x ) will destroy and cleanup container

If you use the 'e' option you will enter the container shell where you will have the opportunity to run your own tests or scripts and/or install packages. Note that all changes will be deleted when you exit the container.
