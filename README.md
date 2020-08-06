# CrowdStrike Docker Detection Container

This container will create detections/preventions on a Linux system protected by a CrowdStrike sensor

# Prerequisites

To use this Detection Container a supported Linux image with Docker and the CrowdStrike Falcon sensor installed. Short description is below.

Install Docker CE in your Linux host
```
https://docs.docker.com/engine/install/
```
Install CrowdStrike Falcon sensor and check Reduced Functionality Mode (RFM) status to verify kernel is fully supported (should return False)
```
sudo /opt/CrowdStrike/falconctl -g --rfm-state
```

## Building
Build the container using a command such as 
```
docker build -t <repository>/cs_centos .
```

## Use your container

Start test container (sudo may be required, initial run requires some download time if retrieved from repository) adding interactive mode and remove container after exit. Reusing container is not recommended due to changes in the container OS.
```
docker run --rm -it <repository>/cs_centos
```
Select an option from the menu to run and check for detections in the CrowdStrike Falcon dashboard. Exit container ( x ) will destroy and cleanup container. 

Using the 'e' option will open the container shell to run your own tests and/or scripts. Note all changes will be deleted when you exit the container (when using --rm option).
