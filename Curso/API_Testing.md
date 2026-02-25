Introduccion al API Testing con Karate

## 1. ¿Qué es API Testing?
El **API Testing** es un tipo de prueba de software que se centra en la validación de las interfaces de programación de aplicaciones (APIs). Las APIs permiten que diferentes aplicaciones se comuniquen entre sí, y el API Testing asegura que estas interfaces funcionen correctamente, sean seguras y cumplan con los requisitos especificados. Este tipo de pruebas es crucial para garantizar la calidad y la fiabilidad de las aplicaciones que dependen de servicios externos o internos a través de APIs.

## 2. Haciendo peticiones HTTP con Karate

### Palabras clave de Karate para peticiones HTTP

1. url: Define la URL base para las peticiones HTTP.
2. path: Especifica el camino adicional a la URL base para formar la URL completa de la petición.
3. request: Define el cuerpo de la petición HTTP, que puede ser en formato JSON, XML o cualquier otro formato requerido por la API.
4. method: Especifica el método HTTP a utilizar (GET, POST, PUT, DELETE, etc.).
5. status: Verifica el código de estado HTTP devuelto por la API.

### Url y Path en Karate

Para definir la URL base y el camino adicional en Karate:

```gherkin

Feature: URL handling

Scenario: Basic URL setup
  Given url 'https://jsonplaceholder.typicode.com/users'
  When method get
  Then status 200
```

Existen diferentes formas de definir el Path en Karate, como se muestra a continuación:

```gherkin
Scenario: Comma-delimited path segments
    Given url 'https://jsonplaceholder.typicode.com'
    Given path 'users', userId
    When method get
    Then status 200

Scenario: Multiple path statements
    Given url 'https://jsonplaceholder.typicode.com'
    Given path 'posts'
    And path userId
    And path 'comments'
    When method get
    Then status 200
```
Es muy importante no usar el símbolo de interrogación `?` al definir el Path. El caracter se codificará automáticamente como `%3F` y la API no reconocerá la petición.

Enfoque incorrecto:

```gherkin
    * path 'users?status=active'  # Results in /users%3Fstatus=active
```
Enfoque correcto:

```gherkin
    * path 'users'
    * param status = 'active'     # Results in /users?status=active
```

Alternativamente, puedes definir la URL completa sin usar `path`:

```gherkin
    * url baseUrl + '/users?status=active'
```

### Body de la petición HTTP

El cuerpo de la petición HTTP se define utilizando la palabra clave `request` en Karate.

```gherkin
Scenario: JSON request body
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'posts'
    And request { title: 'My Post', body: 'Post content', userId: 1 }
    When method post
    Then status 201
    And match response.id == '#number'
```

### Verbos HTTP

Karate soporta los siguientes verbos HTTP para realizar peticiones:

- GET: Recupera información de la API.
- POST: Crea un nuevo recurso en la API.
- PUT: Actualiza un recurso existente en la API.
- DELETE: Elimina un recurso de la API.
- PATCH: Realiza una actualización parcial de un recurso en la API.

Puedes usar estos verbos con la palabra clave `method` para especificar el tipo de petición que deseas realizar.

```gherkin
Scenario: Update a resource with PUT
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'posts/1'
    And request { id: 1, title: 'Updated Post', body: 'Updated content', userId: 1 }
    When method put
    Then status 200
    And match response.title == 'Updated Post'
```
### Validación de respuestas

Después de realizar una petición HTTP, es importante validar la respuesta devuelta por la API.

Para validar el código de estado HTTP, puedes usar la palabra clave `status`:

```gherkin
Feature: Status code validation

Background:
  * url 'https://jsonplaceholder.typicode.com'

Scenario: Success responses
  Given path 'users'
  When method get
  Then status 200

Scenario: Created response
  Given path 'posts'
  And request { title: 'New Post', body: 'Content', userId: 1 }
  When method post
  Then status 201

Scenario: Not Found
  Given path 'users', 99999
  When method get
  Then status 404
```

Para mas información sobre API Testing con Karate, puedes consultar la documentación oficial en el siguiente enlace: [Karate API Testing Documentation](https://docs.karatelabs.io/http-requests/making-requests/).

