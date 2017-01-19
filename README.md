Bootstrap for Minishift development environment
===============================================


This allows you to build Minishift in an online IDE on c9.io or on Docker/OpenShift.


Usage
-----

Create a workspace on [C9.io](http://c9.io), or a new project on [OpenShift](console.preview.openshift.com) using `gbraad/c9ide:f25` as image.

Within the workspace run:
```
$ wget https://gist.githubusercontent.com/gbraad/1496f8847e6cf2d6a695d63616631a1e/raw/5980490e8940dbcf53ca78e3a26fa15a59eb3e37/minishift_bootstrap.sh
```

the result will be available as `/workspace/bin/minishift`


TODO
----

  * `INITURL` as environment veriable for use by the C9 container
  * write `go env` variables to bashrc


Note
----

OpenShift Preview needs a PVC (persistent volume claim) of at least 1G. This needs to be attached to pod, by changing /workspace in the c9ide deployment config.
