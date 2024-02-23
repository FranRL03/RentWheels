package com.proyecto.rentwheels.vehiculo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.util.Objects;
import java.util.UUID;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
public class TipoVehiculo {

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

    private String tipoVehiculo;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TipoVehiculo tipoVehiculo = (TipoVehiculo) o;
        return Objects.equals(id, tipoVehiculo.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
