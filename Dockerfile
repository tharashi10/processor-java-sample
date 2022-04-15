FROM fnproject/fn-java-fdk-build:jdk11-1.0.116 as build-stage
WORKDIR /function
ENV MAVEN_OPTS -Dhttp.proxyHost= -Dhttp.proxyPort= -Dhttps.proxyHost= -Dhttps.proxyPort= -Dhttp.nonProxyHosts= -Dmaven.repo.local=/usr/share/maven/ref/repository
ADD pom.xml /function/pom.xml
ADD settings.xml /root/.m2/settings.xml
RUN ["mvn", "package", "dependency:copy-dependencies", "-DincludeScope=runtime", "-DskipTests=true", "-Dmdep.prependGroupId=true", "-DoutputDirectory=target", "--fail-never"]
ADD src /function/src
RUN ["mvn", "package"]

FROM fnproject/fn-java-fdk:jre11-1.0.116
WORKDIR /function
COPY --from=build-stage /function/target/*.jar /function/app/
CMD ["com.orcl.thara.poc.processor.sample.parse.JsonProcessorFunction::handleRequest"]