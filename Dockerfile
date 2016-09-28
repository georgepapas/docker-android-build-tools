FROM georgepapas/docker-android-sdk:latest

MAINTAINER George Papastamatopoulos "george.papas@gmail.com"

VOLUME /root/.gradle

ENV ANDROID_BUILD_TOOLS_VERSION 24.0.2

ENV DROID_XTRA extra-android-m2repository,extra-android-support,extra-google-m2repository
ENV DROID_TOOLS platform-tools,tools,build-tools-${ANDROID_BUILD_TOOLS_VERSION}
ENV DROID_API_LEVELS android-24 

ENV FILTER ${DROID_XTRA},${DROID_TOOLS},${DROID_API_LEVELS}

RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u -a -n
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u -a --filter ${FILTER}

RUN mkdir -p $ANDROID_HOME/licenses

RUN echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license && \
    echo "84831b9409646a918e30573bab4c9c91346d8abd" > $ANDROID_HOME/licenses/android-sdk-preview-license && \
    echo "d975f751698a77b662f1254ddbeed3901e976f5a" > $ANDROID_HOME/licenses/intel-android-extra-license

WORKDIR /opt/app

ENTRYPOINT ["./gradlew"]
