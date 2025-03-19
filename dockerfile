# Use the Flutter builder image
FROM zekfad/flutter-builder:latest

# Set the working directory inside the container
WORKDIR /app

# Copy pubspec files first to leverage Docker caching
COPY ../pubspec.yaml ../pubspec.lock ./

# Get dependencies
RUN flutter pub get

# Copy the rest of the application files
COPY ../ ./

# Verify Flutter installation
RUN flutter --version
RUN flutter doctor

# Accept Android licenses
RUN yes | flutter doctor --android-licenses

# Build the APK
RUN flutter build apk --verbose

# Verify build output
RUN ls -la /app/build/app/outputs/flutter-apk/

# Ensure /output exists and safely copy the APK
CMD ["sh", "-c", "mkdir -p /app/output && cp -v /app/build/app/outputs/flutter-apk/*.apk /app/output/ && ls -la /app/output"]
