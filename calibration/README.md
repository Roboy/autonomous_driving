## Description

In order to use the Intel Realsense Camera with the SICK lidar an extrinsic calibration needs to be done.
This can be done with the RADOCC and RADLOCC toolbox submodules. You will require a MATLAB license for this.

An extensive step-by-step [Tutorial](https://github.com/Roboy/autonomous_driving/wiki/Calibration:-Extrinsic-calibration-between-camera-and-lidar) can be found in the Github wiki of this repository.

There is also the official [RADOCC](http://www-personal.acfr.usyd.edu.au/akas9185/AutoCalib/AutoCamDoc/index.html) and [RADLOCC](http://www-personal.acfr.usyd.edu.au/akas9185/AutoCalib/AutoLaserCamDoc/index.html) website that provides additional information. Please note that we don't use the submodule [RADOCC](https://github.com/akas9185/RADOCC) from the original creators since it is very old and does not work with current MATLAB versions. Instead we use [RADOCCToolbox](https://github.com/SubMishMar/RADOCCToolbox) which is updated for compatibility with MATLAB 2017b.
