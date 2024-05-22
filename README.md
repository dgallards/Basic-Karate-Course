# Proyecto: Instalación de la herramienta Karate

## Descripción

Karate es una potente herramienta de prueba automatizada que combina capacidades de prueba de API y UI de navegador en una sola solución. Diseñada para facilitar el desarrollo y la ejecución de pruebas, Karate permite a los desarrolladores y testers validar sus aplicaciones de manera eficiente.

## Características de Karate

- **Pruebas de API**: Permite probar RESTful y SOAP APIs de forma sencilla.
- **Pruebas de UI**: Incluye funcionalidades para pruebas de interfaces de usuario de navegador.
- **Integración continua**: Se integra perfectamente con herramientas como Jenkins y otros servidores de CI/CD.
- **DSL intuitivo**: Utiliza un lenguaje de scripting basado en Gherkin, fácil de leer y escribir.

## Prerrequisitos

Antes de instalar Karate, asegúrate de tener instalados los siguientes componentes:

1. **Java**: Karate requiere JDK 8 o superior.
2. **Maven**: Utilizaremos Maven para gestionar las dependencias y ejecutar las pruebas.

## Instalación

### Paso 1: Instalar Java

1. Descarga e instala la última versión del JDK desde la [página oficial de Oracle](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) o utiliza un gestor de paquetes adecuado para tu sistema operativo.
2. Verifica la instalación de Java ejecutando el siguiente comando en tu terminal o línea de comandos:

   ```sh
   java -version
   ```

   Deberías ver una salida similar a:

   ```
   java version "11.0.9" 2020-10-20 LTS
   Java(TM) SE Runtime Environment 18.9 (build 11.0.9+7-LTS)
   Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.9+7-LTS, mixed mode)
   ```

### Paso 2: Instalar Maven

1. Descarga e instala la última versión de Maven desde la [página oficial de Apache Maven](https://maven.apache.org/download.cgi).
2. Configura la variable de entorno `MAVEN_HOME` apuntando al directorio de instalación de Maven y añade `MAVEN_HOME/bin` a tu variable `PATH`.
3. Verifica la instalación de Maven ejecutando el siguiente comando en tu terminal o línea de comandos:

   ```sh
   mvn -version
   ```

   Deberías ver una salida similar a:

   ```
   Apache Maven 3.6.3 (Red Hat 3.6.3-5)
   Maven home: /opt/maven
   Java version: 11.0.9, vendor: Oracle Corporation, runtime: /usr/lib/jvm/java-11-openjdk-amd64
   Default locale: en_US, platform encoding: UTF-8
   OS name: "linux", version: "5.4.0-52-generic", arch: "amd64", family: "unix"
   ```

### Paso 3: Configurar el Proyecto con Karate

1. Crea un nuevo proyecto Maven o navega a tu proyecto existente.
2. Añade la siguiente dependencia en tu archivo `pom.xml` para incluir Karate:

   ```xml
   <dependencies>
       <dependency>
           <groupId>com.intuit.karate</groupId>
           <artifactId>karate-junit5</artifactId>
           <version>1.1.0</version>
           <scope>test</scope>
       </dependency>
   </dependencies>
   ```
3. Crea la estructura del proyecto, añade al archivo `pom.xml` el directorio de los tests
   
   ```xml
   <build>
    <testResources>
        <testResource>
            <directory>src/test/java</directory>
            <excludes>
                <exclude>**/*.java</exclude>
            </excludes>
        </testResource>
    </testResources> 
   </build>
   ```
La estructura de ficheros debería ser la siguiente:

   ```
      src
   └── test
      └── java
         └── animals
               ├── AnimalsTest.java
               ├── cats
               |   ├── cats-post.feature
               |   ├── cats-get.feature
               |   ├── cat.json
               |   └── CatsRunner.java
               └── dogs
                  |
                  ├── dog-crud.feature
                  ├── dog.json
                  ├── some-helper-function.js
                  └── DogsRunner.java
   ```
### Paso 4: Ejecutar Pruebas con Karate

1. Crea un archivo de características (`*.feature`) en el directorio `src/test/resources` para definir tus pruebas. Aquí tienes un ejemplo básico para una prueba de API:

   ```gherkin
   Feature: Prueba de API

   Scenario: Obtener lista de usuarios
       Given url 'https://jsonplaceholder.typicode.com/users'
       When method GET
       Then status 200
       And match response[0].name == 'Leanne Graham'
   ```

2. Para ejecutar tus pruebas, utiliza el siguiente comando Maven:

   ```sh
   mvn test
   ```

   Maven ejecutará tus pruebas de Karate y mostrará los resultados en la consola.

3. Los reportes generados automaticamente se ecuentran en la carpeta `target/karate-reports`, podemos abrir el archivo `karate-summary.html`

4. Para limpiar el proyecto y borrar los repportes antiores puedes ejecutar `clean`. 

   ```sh
   mvn test
   ```


## Recursos Adicionales

- [Documentación oficial de Karate](https://github.com/intuit/karate)
- [Guía de inicio rápido de Karate](https://github.com/intuit/karate#getting-started)
- [Ejemplos y tutoriales](https://github.com/intuit/karate/tree/master/karate-demo)
- [Documentacón de Karate API](https://github.com/karatelabs/karate?tab=readme-ov-file#syntax-guide)
- [Documentacón de Karate UI](https://karatelabs.github.io/karate/karate-core/)

## Webs para probar

**Pruebas de API**: 
- [reqres.in](https://reqres.in/)
- [restful-booker](https://restful-booker.herokuapp.com/)
- [jsonplaceholder](https://jsonplaceholder.typicode.com)

**Pruebas de UI**:  
- [demoblaze](https://www.demoblaze.com/index.html)
- [automationexercise](https://automationexercise.com/)
- [commitquality](https://commitquality.com/)
