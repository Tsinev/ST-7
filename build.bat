@echo off
set CLASSPATH=lib\selenium-java-4.15.0.jar;lib\json-simple-1.1.1.jar;lib\selenium-api-4.15.0.jar

REM Download additional required JARs if not present
if not exist "lib\selenium-remote-driver-4.15.0.jar" (
    echo Downloading selenium-remote-driver...
    curl -L -o lib\selenium-remote-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-remote-driver/4.15.0/selenium-remote-driver-4.15.0.jar
)

if not exist "lib\selenium-support-4.15.0.jar" (
    echo Downloading selenium-support...
    curl -L -o lib\selenium-support-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-support/4.15.0/selenium-support-4.15.0.jar
)

if not exist "lib\selenium-chromium-driver-4.15.0.jar" (
    echo Downloading selenium-chromium-driver...
    curl -L -o lib\selenium-chromium-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-chromium-driver/4.15.0/selenium-chromium-driver-4.15.0.jar
)

if not exist "lib\selenium-chrome-driver-4.15.0.jar" (
    echo Downloading selenium-chrome-driver...
    curl -L -o lib\selenium-chrome-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-chrome-driver/4.15.0/selenium-chrome-driver-4.15.0.jar
)

if not exist "lib\selenium-edge-driver-4.15.0.jar" (
    echo Downloading selenium-edge-driver...
    curl -L -o lib\selenium-edge-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-edge-driver/4.15.0/selenium-edge-driver-4.15.0.jar
)

if not exist "lib\selenium-firefox-driver-4.15.0.jar" (
    echo Downloading selenium-firefox-driver...
    curl -L -o lib\selenium-firefox-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-firefox-driver/4.15.0/selenium-firefox-driver-4.15.0.jar
)

if not exist "lib\selenium-ie-driver-4.15.0.jar" (
    echo Downloading selenium-ie-driver...
    curl -L -o lib\selenium-ie-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-ie-driver/4.15.0/selenium-ie-driver-4.15.0.jar
)

if not exist "lib\selenium-safari-driver-4.15.0.jar" (
    echo Downloading selenium-safari-driver...
    curl -L -o lib\selenium-safari-driver-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-safari-driver/4.15.0/selenium-safari-driver-4.15.0.jar
)

if not exist "lib\selenium-http-4.15.0.jar" (
    echo Downloading selenium-http...
    curl -L -o lib\selenium-http-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-http/4.15.0/selenium-http-4.15.0.jar
)

if not exist "lib\selenium-json-4.15.0.jar" (
    echo Downloading selenium-json...
    curl -L -o lib\selenium-json-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-json/4.15.0/selenium-json-4.15.0.jar
)

if not exist "lib\selenium-manager-4.15.0.jar" (
    echo Downloading selenium-manager...
    curl -L -o lib\selenium-manager-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-manager/4.15.0/selenium-manager-4.15.0.jar
)

if not exist "lib\opentelemetry-api-1.31.0.jar" (
    echo Downloading opentelemetry-api...
    curl -L -o lib\opentelemetry-api-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-api/1.31.0/opentelemetry-api-1.31.0.jar
)

if not exist "lib\opentelemetry-context-1.31.0.jar" (
    echo Downloading opentelemetry-context...
    curl -L -o lib\opentelemetry-context-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-context/1.31.0/opentelemetry-context-1.31.0.jar
)

if not exist "lib\opentelemetry-exporter-logging-1.31.0.jar" (
    echo Downloading opentelemetry-exporter-logging...
    curl -L -o lib\opentelemetry-exporter-logging-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-exporter-logging/1.31.0/opentelemetry-exporter-logging-1.31.0.jar
)

if not exist "lib\opentelemetry-sdk-1.31.0.jar" (
    echo Downloading opentelemetry-sdk...
    curl -L -o lib\opentelemetry-sdk-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-sdk/1.31.0/opentelemetry-sdk-1.31.0.jar
)

if not exist "lib\opentelemetry-sdk-common-1.31.0.jar" (
    echo Downloading opentelemetry-sdk-common...
    curl -L -o lib\opentelemetry-sdk-common-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-sdk-common/1.31.0/opentelemetry-sdk-common-1.31.0.jar
)

if not exist "lib\opentelemetry-sdk-trace-1.31.0.jar" (
    echo Downloading opentelemetry-sdk-trace...
    curl -L -o lib\opentelemetry-sdk-trace-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-sdk-trace/1.31.0/opentelemetry-sdk-trace-1.31.0.jar
)

if not exist "lib\opentelemetry-sdk-metrics-1.31.0.jar" (
    echo Downloading opentelemetry-sdk-metrics...
    curl -L -o lib\opentelemetry-sdk-metrics-1.31.0.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-sdk-metrics/1.31.0/opentelemetry-sdk-metrics-1.31.0.jar
)

if not exist "lib\opentelemetry-semconv-1.21.0-alpha.jar" (
    echo Downloading opentelemetry-semconv...
    curl -L -o lib\opentelemetry-semconv-1.21.0-alpha.jar https://repo1.maven.org/maven2/io/opentelemetry/opentelemetry-semconv/1.21.0-alpha/opentelemetry-semconv-1.21.0-alpha.jar
)

if not exist "lib\failsafe-3.3.2.jar" (
    echo Downloading failsafe...
    curl -L -o lib\failsafe-3.3.2.jar https://repo1.maven.org/maven2/dev/failsafe/failsafe/3.3.2/failsafe-3.3.2.jar
)

if not exist "lib\guava-32.1.2-jre.jar" (
    echo Downloading guava...
    curl -L -o lib\guava-32.1.2-jre.jar https://repo1.maven.org/maven2/com/google/guava/guava/32.1.2-jre/guava-32.1.2-jre.jar
)

if not exist "lib\failureaccess-1.0.1.jar" (
    echo Downloading failureaccess...
    curl -L -o lib\failureaccess-1.0.1.jar https://repo1.maven.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar
)

if not exist "lib\jsr305-3.0.2.jar" (
    echo Downloading jsr305...
    curl -L -o lib\jsr305-3.0.2.jar https://repo1.maven.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar
)

if not exist "lib\checker-qual-3.37.0.jar" (
    echo Downloading checker-qual...
    curl -L -o lib\checker-qual-3.37.0.jar https://repo1.maven.org/maven2/org/checkerframework/checker-qual/3.37.0/checker-qual-3.37.0.jar
)

if not exist "lib\error_prone_annotations-2.21.1.jar" (
    echo Downloading error_prone_annotations...
    curl -L -o lib\error_prone_annotations-2.21.1.jar https://repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.21.1/error_prone_annotations-2.21.1.jar
)

if not exist "lib\failureaccess-1.0.1.jar" (
    echo Downloading failureaccess...
    curl -L -o lib\failureaccess-1.0.1.jar https://repo1.maven.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar
)

if not exist "lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar" (
    echo Downloading listenablefuture...
    curl -L -o lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar https://repo1.maven.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar
)

if not exist "lib\j2objc-annotations-2.8.jar" (
    echo Downloading j2objc-annotations...
    curl -L -o lib\j2objc-annotations-2.8.jar https://repo1.maven.org/maven2/com/google/j2objc/j2objc-annotations/2.8/j2objc-annotations-2.8.jar
)

if not exist "lib\selenium-os-4.15.0.jar" (
    echo Downloading selenium-os...
    curl -L -o lib\selenium-os-4.15.0.jar https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-os/4.15.0/selenium-os-4.15.0.jar
)

echo Compiling project...
mkdir build 2>nul
set FULL_CLASSPATH=%CLASSPATH%;lib\selenium-remote-driver-4.15.0.jar;lib\selenium-support-4.15.0.jar;lib\selenium-chromium-driver-4.15.0.jar;lib\selenium-chrome-driver-4.15.0.jar;lib\selenium-edge-driver-4.15.0.jar;lib\selenium-firefox-driver-4.15.0.jar;lib\selenium-ie-driver-4.15.0.jar;lib\selenium-safari-driver-4.15.0.jar;lib\selenium-http-4.15.0.jar;lib\selenium-json-4.15.0.jar;lib\selenium-manager-4.15.0.jar;lib\opentelemetry-api-1.31.0.jar;lib\opentelemetry-context-1.31.0.jar;lib\opentelemetry-exporter-logging-1.31.0.jar;lib\opentelemetry-sdk-1.31.0.jar;lib\opentelemetry-sdk-common-1.31.0.jar;lib\opentelemetry-sdk-trace-1.31.0.jar;lib\opentelemetry-sdk-metrics-1.31.0.jar;lib\opentelemetry-semconv-1.21.0-alpha.jar;lib\failsafe-3.3.2.jar;lib\guava-32.1.2-jre.jar;lib\failureaccess-1.0.1.jar;lib\jsr305-3.0.2.jar;lib\checker-qual-3.37.0.jar;lib\error_prone_annotations-2.21.1.jar;lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;lib\j2objc-annotations-2.8.jar;lib\selenium-os-4.15.0.jar
javac -d build -cp "%FULL_CLASSPATH%" src/main/java/ru/unn/st7/*.java

if errorlevel 1 (
    echo Compilation failed!
    exit /b 1
)

echo Compilation successful!
echo.
echo Running application...
java -cp "build;lib\selenium-java-4.15.0.jar;lib\json-simple-1.1.1.jar;lib\selenium-api-4.15.0.jar;lib\selenium-remote-driver-4.15.0.jar;lib\selenium-support-4.15.0.jar;lib\selenium-chromium-driver-4.15.0.jar;lib\selenium-chrome-driver-4.15.0.jar;lib\selenium-edge-driver-4.15.0.jar;lib\selenium-firefox-driver-4.15.0.jar;lib\selenium-ie-driver-4.15.0.jar;lib\selenium-safari-driver-4.15.0.jar;lib\selenium-http-4.15.0.jar;lib\selenium-json-4.15.0.jar;lib\selenium-manager-4.15.0.jar;lib\opentelemetry-api-1.31.0.jar;lib\opentelemetry-context-1.31.0.jar;lib\opentelemetry-exporter-logging-1.31.0.jar;lib\opentelemetry-sdk-1.31.0.jar;lib\opentelemetry-sdk-common-1.31.0.jar;lib\opentelemetry-sdk-trace-1.31.0.jar;lib\opentelemetry-sdk-metrics-1.31.0.jar;lib\opentelemetry-semconv-1.21.0-alpha.jar;lib\failsafe-3.3.2.jar;lib\guava-32.1.2-jre.jar;lib\failureaccess-1.0.1.jar;lib\jsr305-3.0.2.jar;lib\checker-qual-3.37.0.jar;lib\error_prone_annotations-2.21.1.jar;lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;lib\j2objc-annotations-2.8.jar;lib\selenium-os-4.15.0.jar" ru.unn.st7.App
