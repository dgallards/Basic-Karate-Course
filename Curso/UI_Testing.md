Introduccion al testing de interfaces de usuario (UI Testing)

## 1. ¿Qué es UI Testing?
El **UI Testing** (pruebas de interfaz de usuario) es un tipo de prueba de software que se centra en validar la funcionalidad, usabilidad y apariencia de la interfaz de usuario de una aplicación. El objetivo principal del UI Testing es asegurarse de que los usuarios puedan interactuar con la aplicación de manera efectiva y sin errores, garantizando una experiencia de usuario satisfactoria. Estas pruebas pueden incluir la verificación de elementos visuales, la interacción con botones, formularios, menús y otros componentes de la interfaz.

## 2. Automatización de UI Testing con Karate

### Palabras clave de Karate para UI Testing

1. configure driver: Configura el controlador del navegador para las pruebas de UI.
2. driver: Inicia una sesión de navegador y navega a la URL especificada.
3. match: Verifica que un elemento de la interfaz de usuario cumple con una condición específica.
4. click: Simula un clic en un elemento de la interfaz de usuario.
5. input: Simula la entrada de texto en un campo de la interfaz de usuario.
6. waitFor: Espera a que un elemento de la interfaz de usuario esté presente o visible antes de continuar con la prueba.
7. delay: Introduce una pausa en la ejecución de la prueba.

### Configuración del driver en Karate
Para configurar el driver en Karate, se utiliza la palabra clave `configure driver` seguida de los parámetros necesarios para especificar el navegador y otras opciones de configuración. Por ejemplo:

```gherkin
Feature: UI Testing with Karate
    Background:
        * configure driver = { type: 'chrome' }
```
En este ejemplo, se configura el driver para utilizar el navegador Chrome. Karate también admite otros navegadores como Firefox, Edge y Safari, y se pueden especificar opciones adicionales como la ubicación del controlador del navegador, la resolución de la ventana, entre otros.

### Match, click y input en Karate
Una vez que el driver está configurado, se pueden utilizar las palabras clave `match`, `click` e `input` para interactuar con los elementos de la interfaz de usuario. Karate utiliza selectores CSS para identificar los elementos de la interfaz de usuario. Por ejemplo:

```gherkin
Scenario: Interact with UI elements
    Given driver 'https://example.com/login'
    When input('#username', 'myUsername')
    And input('#password', 'myPassword')
    And click('#loginButton')
    Then match '#welcomeMessage' contains 'Welcome, myUsername'
```

Tambien se pueden utilizar otras formas de seleccionar elementos, como XPath o selectores de texto. Por ejemplo:

```gherkin
Scenario: Select elements using different selectors
    Given driver 'https://example.com'
    When click('button:contains("Sign Up")')  # Selector de texto
    And click('//a[@href="/contact"]')        # Selector XPath
    Then match '.header' contains 'Contact Us'  # Selector CSS
```

### WaitFor y delay en Karate
En las pruebas de UI, es común que algunos elementos tarden en cargarse o volverse visibles. Para manejar esto, Karate proporciona las palabras clave `waitFor` y `delay`. `waitFor` se utiliza para esperar a que un elemento esté presente o visible antes de continuar con la prueba, mientras que `delay` introduce una pausa fija en la ejecución de la prueba. Por ejemplo:

```gherkin
Scenario: Wait for elements to load
    Given driver 'https://example.com/dashboard'
    When waitFor('#loadingSpinner')  # Espera a que el spinner de carga desaparezca
    And match '#welcomeMessage' contains 'Welcome back!'
    And delay(2000)  # Pausa de 2 segundos antes de continuar
```

Para mas información sobre UI Testing con Karate, puedes consultar la documentación oficial en el siguiente enlace: [Karate UI Testing Documentation](https://docs.karatelabs.io/extensions/ui-testing/).

