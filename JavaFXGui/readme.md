
# JavaFX GUI

This directory holds a Java FX GUI which may be compiled using `gradle` or the
wrapper scripts `./gradle` or `.\gradle.bat`.

# Run a development build

```bash
gradle run
.\\gradlew.bat run
./gradlew run
```

# Build a .jar file

```bash
gradle jar
.\\gradlew.bat jar
./gradlew jar
```

The jarfile is produced in `build/libs/JavaFXGui.jar`, which itself
should be able to run with:

```bash
java -jar build/libs/JavaFXGui.jar
```

# Gradle

The [gradle](https://gradle.org/) build tool reads build configuration
written in [groovy](http://groovy-lang.org/), a scripting language
which runs on the JVM. Gradle provides a number of
configuration targets and a [plugin system](https://docs.gradle.org/current/userguide/plugins.html).

The `JavaFXGui` app uses this flexibility to include a file from
another part of the repository and add it to the CLASSPATH at runtime,
which happens by adding `project.file('../html/Testing/')` to the list
of source directories for the main build:

```
sourceSets {
    main {
        resources {
            srcDirs "src/main/resources", project.file('../html/Testing/') // contains jsprimary.html
        }
    }
}
```

This lets us put `../html/Testing/jsprimary.html` in a `WebView` without needing to manually copy files in;
the gradle build script handles that for us.

# Application Assumptions

This program assumes it is running on java 9+.

If this is compiled with an older version of java the following
error message will be given:

```
FAILURE: Build failed with an exception.

* What went wrong:
java.lang.UnsupportedClassVersionError: org/openjfx/gradle/JavaFXPlugin has been compiled by a more recent version of the Java Runtime (class file version 55.0), this version of the Java Runtime only recognizes class file versions up to 52.0
> org/openjfx/gradle/JavaFXPlugin has been compiled by a more recent version of the Java Runtime (class file version 55.0), this version of the Java Runtime only recognizes class file versions up to 52.0

```

To build with older versions comment the plugin line `id 'org.openjfx.javafxplugin' version '0.0.9'`
and the `javafx { }` block in `build.gradle`.

Oracle provides [JavaFX install instructions](https://docs.oracle.com/javafx/2/installation/jfxpub-installation.htm)
but with java 8 they included it in the JVM, which makes it an easy choice for
older editions of Java.

Modern java (9+) should look at [OpenJFX](https://openjfx.io/), which
distributes a copy of JavaFX that understand's java 9+'s new module system.

The Java 8 FX and Java 9+ FX builds are different enough that they are
totally incompatible if you decide to bundle the FX runtime with your app;
you can either bundle version 8 and run on java 6/7/8 or bundle 9+ and run
on 11/12/13/14. Right now we sidestep this by assuming the host has javafx available,
but it is a good point to be aware of.


