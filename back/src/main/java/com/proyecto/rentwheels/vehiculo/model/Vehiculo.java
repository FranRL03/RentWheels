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

    private String modelo;
    private String imagen;
    private String combustible;
    private String transmision;
    private int capacidadPasajeros;
    private int autonomia;
    private int potencia;
    private String estado;
    private int numPuertas;

    @ManyToOne
    private TipoVehiculo tipoVehiculo;
}
