# docker-android-build-tools

Run the container and mount your project directory to ``/opt/app``

## Usage

Perform a build by running the following command:

``docker run --rm -v $(pwd):/opt/app georgepapas/android-build-tools:latest clean assemble``

### Save build time by creating a gradle cache volume...
Create a container that will hold your gradle dependencies. This will ensure you don't have to download all your gradle dependencies on each build.

``docker create --name gradle-caches georgepapas/gradle-caches:latest``

Then mount this container's volumes when running a build:

``docker run --rm --volumes-from gradle-caches -v $(pwd):/opt/app georgepapas/android-build-tools:latest clean assemble``


## Environment
``ANDROID_HOME=/opt/android-sdk-linux``

``WORKDIR`` is ``/opt/app``


## ENTRYPOINT
``./gradlew`` is configured as the entrypoint

## Latest
  - Build ``tools 23.0.3``
  - Api ``android_23``

## Tags  

### android-23
  - Android ``SDK 24.4.1``
  - Build ``tools 23.0.3``
  - Api ``android_23``
