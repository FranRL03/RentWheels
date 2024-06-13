package com.proyecto.rentwheels.usuario.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

public record EditClientDto (
//        @URL(message = "{loggedUser.url}")
        String avatar,
        @Email(message = "{loggedUser.email}")
        String email,
        String telefono,
        String pin,
        double cash
){
}
