package com.proyecto.rentwheels.usuario.model;
import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Entity
@Getter
@Setter
@AllArgsConstructor
@ToString
@SuperBuilder
@NoArgsConstructor
public class Cliente extends Usuario {

    private String email;
    private String telefono;
    private String pin;

}
