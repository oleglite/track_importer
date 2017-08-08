# GDAL Docker Images

Based on geo-data/gdal-docker tag 2.1.3

Service for importing *.gpx files to postgis

## Usage

Running the container without any arguments will by default output the GDAL
version string as well as the supported raster and vector formats:

    docker run geodata/gdal

The following command will open a bash shell in an Ubuntu based environment
with GDAL available:

    docker run -t -i geodata/gdal /bin/bash

You will most likely want to work with data on the host system from within the
docker container, in which case run the container with the -v option. Assuming
you have a raster called `test.tif` in your current working directory on your
host system, running the following command should invoke `gdalinfo` on
`test.tif`:

    docker run -v $(pwd):/data geodata/gdal gdalinfo test.tif

This works because the current working directory is set to `/data` in the
container, and you have mapped the current working directory on your host to
`/data`.

Note that the image tagged `latest`, GDAL represents the latest code *at the
time the image was built*. If you want to include the most up-to-date commits
then you need to build the docker image yourself locally along these lines:

    docker build -t geodata/gdal:local git://github.com/geo-data/gdal-docker/
