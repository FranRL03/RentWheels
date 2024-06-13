# RentWheels

Es una App de renting de coches. El back está diseñado con una **API REST** en **Spring Boot 3** y
el front está diseñada con **Flutter**

## Built With

Lo necesario para poder inicar y probar la aplicación se necesita:

- Spring Boot 3
- Docker
- Postman (opcional para probar las peticiones del back)
- Flutter
- Android Studio

## Deployment

Estos son los pasos para probar la App:

- Clonar el repositorio

        git clone https://github.com/FranRL03/RentWheels.git

- Abrir docker y la terminal para entrar en la carpeta 
*back* y ejecutar el siguiente commando

        docker-compose up

- Abrir el back e iniciarlo

        mvn spring-boot:run

  Una vez iniciado el back ahora se inicia el front.
  Se abre la carpeta *flutter_rent_car* y en el archivo 
  *pubspec.yaml* se descargan los paquetes.

  ![image](https://github.com/FranRL03/RentWheels/assets/122262348/cc180b19-8d6d-45b5-a380-2585f533514b)

  Abre un emulador movil pulsando en la esquina inferior derecha en *No device* y elige el emulador más deseado
  
  ![image](https://github.com/FranRL03/RentWheels/assets/122262348/d84ca45c-3b9e-4ec4-a04c-4a82490a05e3)

  Una vez hecho estos pasos y con el emulador ya cargado se abre el archivo main en la ruta `\lib\main.dart`, 
  en la esquina superior derecha se pulsa en `Run Without Debugging`.

  ![image](https://github.com/FranRL03/RentWheels/assets/122262348/8b7e5f8a-5406-463f-8f4b-55828de2ea36)


## Functionalities

Algunas de las funcionalidades que se pueden hacer en la App es que al iniciar sesión navega a la *Home Page*, 
donde muestra una lista de coches y puedes filtrar por modelos

Al seleccionar un vehículo si está disponible nos saldrá un pequeño formulario para poder alquilarlo por unos diás, semanas o meses aplicandole un descuento
dependiendo de la cantidad de días que se alquilen. Así motivamos al cliente a que utilice más la app. 

![image](https://github.com/FranRL03/RentWheels/assets/122262348/916e3998-d334-431d-b358-537733b09602)

Al navegar a tu perfil puedes: 
- Editar los datos
- Ver los alquieres realizados
- Cambiar la contraseña

  ![image](https://github.com/FranRL03/RentWheels/assets/122262348/849d574f-e24f-4794-9ddc-e7e2bd40ace3)

## ADMIN

Para iniciar la pagina web que es el entorno del administrador iniciamos el back como se ha hecho anteriormente.
Se abre la carpeta *angular-admin* y en la consola a la altura del archivo `package.json` escribimos el siguiente comando:

- Para descargar/actualizar la carpeta `node_modules`:

        npm i

 - Para iniciar la web: 

        ng serve -o

Una vez iniciada la página solo queda loguearnos con el usuario de administrador y ya se podrá gestionar los datos que 
sean necesarios.

## USERS

- ROL_CLIENTE

     Username: `fernando01`
  
     Contraseña: `1234`
  
- ROL_ADMIN

     Username: `fran02`
  
     Contraseña: `1234`

## Author

  - **Francisco Javier Ruiz Lebrón** 

