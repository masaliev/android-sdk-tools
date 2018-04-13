FROM ubuntu:17.10

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux

ENV DEBIAN_FRONTEND noninteractive

# Install required tools
# Dependencies to execute Android builds

RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
  libc6:i386 \
  libgcc1:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  zlib1g:i386 \
  openjdk-8-jdk \
  wget \
  unzip \
  && apt-get clean

RUN groupadd android && mkdir /opt/android-sdk-linux && useradd -d /opt/android-sdk-linux -g android android

RUN wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O /opt/sdk-tools-linux.zip \
  && unzip /opt/sdk-tools-linux.zip -d ${ANDROID_SDK_HOME} \
  && rm -f /opt/sdk-tools-linux.zip

RUN mkdir -p ~/.android/ && touch ~/.android/repositories.cfg

