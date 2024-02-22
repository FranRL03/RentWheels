package com.proyecto.rentwheels.vehiculo.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.util.UUID;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Vehiculo {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator",
            parameters = {
                    @Parameter(
                            name = "uuid_gen_strategy_class",
                            value = "org.hibernate.id.uuid.CustomVersionOneStrategy"
                    )
            }
    )
    @Column(columnDefinition = "uuid")
    private UUID id;

    private double precio;
    private String modelo;
    //EL COMBUSTOBLE LO PONGO COMO UN ENUM (GASOLINA, DIESEL, ELECTRICO O HIBRIDO)?
    private String combustible;
    //LA TRANSMISION LA PONGO COMO UN ENUM (MANUAL, AUTOMÁTICO)?
    private String transmision;
    private int capacidadPasajeros;

//EJEMPLOS DE ATRIBUTOS

//    Coche:
//
//    Número de puertas: Puede ser 2 puertas, 4 puertas, etc.
//    Tipo de carrocería: Sedán, SUV, coupé, hatchback, etc.
//    Capacidad del maletero: Cuánto espacio tiene el maletero para cargar equipaje u otros objetos.
//    Sistema de tracción: Delantera, trasera o integral.
//
//    Motocicleta:
//
//    Cilindrada del motor: La capacidad del motor en centímetros cúbicos (cc).
//    Tipo de motocicleta: Deportiva, cruiser, touring, etc.
//    Altura del asiento: Altura desde el suelo hasta el asiento.
//    Tipo de suspensión: Delantera telescópica, trasera monoamortiguador, etc.
//
//    Camión:
//
//    Capacidad de carga: La cantidad de peso que puede transportar el camión.
//    Longitud del remolque: Para camiones con remolques.
//    Tipo de remolque: Plataforma plana, caja seca, cisterna, etc.
//    Potencia del motor: La potencia del motor en caballos de fuerza (HP) o kilovatios (kW).
//
//    Avión:
//
//    Envergadura: La distancia entre los extremos de las alas.
//    Tipo de motor: Turbina de reacción, hélice, etc.
//    Altitud máxima de operación: La altitud máxima a la que puede volar el avión.
//    Autonomía: La distancia que puede recorrer el avión sin necesidad de repostar.
//
//    Barco:
//
//    Eslora: Longitud total del barco.
//    Tipo de casco: Monocasco, catamarán, trimarán, etc.
//    Velocidad máxima: La velocidad máxima que puede alcanzar el barco.
//    Capacidad de combustible: La cantidad de combustible que puede llevar el barco.
}
