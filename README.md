<div align="center">
  <a href="https://mit.edu/sparklab/">
    <img align="left" src="images/spark_logo.png" height="80" alt="sparklab">
  </a>
  <a href="https://mit.edu">
    <img align="center" src="images/mit_logo.png" height="80" alt="mit">
  </a>
  <a href="http://acl.mit.edu/">
    <img align="right" src="images/acl_logo.jpeg" height="80" alt="acl">
  </a>
</div>

# Kimera-Multi
>**Note**
>The individual repositories of the system might either be not yet online, or the updated changes has not yet been made public. Preparing these repositories and adding examples is ongoing. The tentative available date for the complete system is April 5th, 2023.

Kimera-Multi is a multi-robot system that 
(i) is robust and capable of identifying and rejecting incorrect inter and intra-robot loop closures resulting from perceptual aliasing, 
(ii) is fully distributed and only relies on local (peer-to-peer) communication to achieve distributed localization and mapping,
and (iii) builds a globally consistent metric-semantic 3D mesh model of the environment in real-time, where faces of the mesh are annotated with semantic labels. Kimera-Multi is implemented by a team of robots equipped with visual-inertial sensors. Each robot builds a local trajectory estimate and a local mesh using Kimera. When communication is available, robots initiate a distributed place recognition and robust pose graph optimization protocol based on a novel distributed graduated non-convexity algorithm. The proposed protocol allows the robots to improve their local trajectory estimates by leveraging inter-robot loop closures while being robust to outliers. Finally, each robot uses its improved trajectory estimate to correct the local mesh using mesh deformation techniques.

<p align="center">
    <a href="https://youtu.be/G8PktlQ82uw">
    <img src="images/kimera_multi.png" alt="Kimera-Multi">
    </a>
</p>

## Installation

**Note**
The installation has only been tested on a team of robots with Ubuntu 18.04 and ROS Melodic.
```
# Create workspace
mkdir -p catkin_ws/src
cd catkin_ws/src/
git clone git@github.com:MIT-SPARK/Kimera-Multi.git kimera_multi

# If you do not have these dependencies already
sudo bash kimera_multi/install/dependencies.sh

# For full install
vcs import . --input kimera_multi/repos/kimera_multi.repos --recursive

cd ..
# Configure build options and build!
catkin config -a --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DGTSAM_TANGENT_PREINTEGRATION=OFF -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF -DOPENGV_BUILD_WITH_MARCH_NATIVE=OFF
catkin build --continue -s
```

## Examples & Usage

## Citation

If you found Kimera-Multi to be useful, we would really appreciate if you could cite our work:

- [1] Y. Chang, Y. Tian, J. P. How and L. Carlone, "Kimera-Multi: a System for Distributed Multi-Robot Metric-Semantic Simultaneous Localization and Mapping," 2021 IEEE International Conference on Robotics and Automation (ICRA), Xi'an, China, 2021, pp. 11210-11218, doi: 10.1109/ICRA48506.2021.9561090.

```bibtex
@INPROCEEDINGS{chang21icra_kimeramulti,
  author={Chang, Yun and Tian, Yulun and How, Jonathan P. and Carlone, Luca},
  booktitle={2021 IEEE International Conference on Robotics and Automation (ICRA)}, 
  title={Kimera-Multi: a System for Distributed Multi-Robot Metric-Semantic Simultaneous Localization and Mapping}, 
  year={2021},
  volume={},
  number={},
  pages={11210-11218},
  doi={10.1109/ICRA48506.2021.9561090}
}

```

- [2] Y. Tian, Y. Chang, F. Herrera Arias, C. Nieto-Granda, J. P. How and L. Carlone, "Kimera-Multi: Robust, Distributed, Dense Metric-Semantic SLAM for Multi-Robot Systems," in IEEE Transactions on Robotics, vol. 38, no. 4, pp. 2022-2038, Aug. 2022, doi: 10.1109/TRO.2021.3137751.
```bibtex
@ARTICLE{tian22tro_kimeramulti,
  author={Tian, Yulun and Chang, Yun and Herrera Arias, Fernando and Nieto-Granda, Carlos and How, Jonathan P. and Carlone, Luca},
  journal={IEEE Transactions on Robotics}, 
  title={Kimera-Multi: Robust, Distributed, Dense Metric-Semantic SLAM for Multi-Robot Systems}, 
  year={2022},
  volume={38},
  number={4},
  pages={2022-2038},
  doi={10.1109/TRO.2021.3137751}
}

```

## Datasets

We have also released some [real-life datasets](https://github.com/MIT-SPARK/Kimera-Multi-Data) collected on 8 robots on the MIT campus.

## Acknowledgements
Kimera-Multi was supported in part by ARL [DCIST](https://www.dcist.org), [ONR](https://www.nre.navy.mil/), and [MathWorks](https://www.mathworks.com/).
