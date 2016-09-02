FROM georgepapas/docker-android-sdk:latest

MAINTAINER George Papastamatopoulos "george.papas@gmail.com"

VOLUME /root/.gradle

ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0

ENV DROID_XTRA extra-android-m2repository,extra-android-support,extra-google-m2repository
ENV DROID_TOOLS platform-tools,tools,build-tools-${ANDROID_BUILD_TOOLS_VERSION}
ENV DROID_API_LEVELS android-23 

ENV FILTER ${DROID_XTRA},${DROID_TOOLS},${DROID_API_LEVELS}

RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u -a -n
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u -a --filter ${FILTER}

WORKDIR /opt/app

ENTRYPOINT ["./gradlew"]
