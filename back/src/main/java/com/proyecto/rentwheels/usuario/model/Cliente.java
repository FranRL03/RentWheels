package com.proyecto.rentwheels.usuario.model;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.ArrayList;
import java.util.List;

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
