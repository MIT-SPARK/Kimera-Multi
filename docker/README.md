# Kimera-Multi Deployment Docker Image

This repo contains scripts to build a docker image for running the kimera-multi system. Tested on Ubuntu 22.04.

Progress:
- [x] Basic docker image with example to run `Outdoor` dataset
- [ ] Add examples to run `Tunnel` and `Hybrid` datasets from IROS23 paper
- [ ] Enable rviz visualization with docker

## Instructions to build and run 6-robot example

1. Build the docker image.
```
./build.bash`
```
Building the entire catkin workspace will take some time. 
The final docker image is about 20GB.

2. Open `run.bash` and edit the `DATASET_ROOT` variable to be path to the kimera-multi dataset on the host machine. See `run.bash` for details.

3. Launch the docker image
```
`./run.bash`
```

4. Inside the docker container, run:
```
source /root/catkin_ws/devel/setup.bash
tmuxp load /root/volume/1014-example-docker.yaml
```

5. The logs produced by the system will be stored at the `volume/logs` folder.

## Running on another dataset
1. To run on other datasets, a yaml file similar to `volume/1014-example-docker.yaml` can be created and placed in the `volume` folder.

2. Inside docker, launch the yaml file. As a reference:
```
tmuxp load /root/volume/NAME_OF_NEW_YAML_FILE.yaml
```

### Acknowledgements
This docker image is developed based on the [Kimera-VIO image](https://github.com/fishberg/kimera-vio-docker) by Andrew Fishberg.
