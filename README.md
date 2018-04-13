# Docker Android SDK tools

Build, test etc your android app with docker. You can also use it in Continuous Integration. Only Ubuntu 17.10, Java 8, Android SDK tools and nothing else. Emulator and preinstalled platforms are not included. 

## Getting Started

These instructions will get you started and allow you to make tests, build apks inside docker.

### Prerequisites

You need to have these things installed:

- [Docker](https://docs.docker.com/install/)


### Installing

1. Add ```FROM masaliev/android-sdk-tools``` to your ```Dockerfile```
2. [Copy license file](https://developer.android.com/studio/intro/update.html#download-with-gradle) from your local machine
3. Specify your ```WORKDIR``` and ```COPY``` project

Example:
```
FROM masaliev/android-sdk-tools

COPY <your_android_sdk_path>/licenses/android-sdk-license ${ANDROID_SDK_HOME}/licenses/android-sdk-license

WORKDIR /app

COPY . /app
```

### Build
`docker build -t <your_image_tag> .`

### Run
`docker run <your_image_tag> ./gradlew testDebugUnitTest`

You can make faster consecutive runs by mounting gradle and/or android sdk paths.

```
docker run \
	--mount source=gradle_mount,target=/root/.gradle \
	--mount source=sdk_mount,target=/opt/android-sdk-linux \
	<your_tag> ./gradlew test
```

## Troubleshooting

If you get error like this ```The SDK directory '/home/<your_name>/Android/Sdk' does not exist.``` add file ```.dockerignore``` with content ```local.properties```, then build and run again.

## Authors

* **Berdimurat Masaliev** - [GitHub](https://github.com/masaliev)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

