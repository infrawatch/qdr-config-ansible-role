Building the RPM
================

To build the RPM, you can reuse the script that is provided for use with CI.

The container can be run from the root directory of the repo:

```
   sudo docker run --network host -i --volume $PWD:/opt:z --workdir /opt quay.io/fedora/fedora:34 /bin/bash -c './build_tools/build_rpms.sh'
```

Once the container has run, you can find the created rpm in the root directory of the repo.

