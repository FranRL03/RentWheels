package com.proyecto.rentwheels.usuario.dto;

import com.proyecto.rentwheels.validacion.annotacion.FieldsValueMatch;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;

@FieldsValueMatch.List({
        @FieldsValueMatch(
                field = "password", fieldMatch = "verifyPassword",
                message = "{createClient.password.nomatch}"
        ),
})
public record CreateClientDto(
        @NotEmpty(message = "{createClient.username}")
        String username,
        @NotEmpty(message = "{createClient.password.notempty}")
        String password,
        @NotEmpty(message = "{createClient.verifyPassword.notempty}")
        String verifyPassword,
//        @URL(message = "{loggedUser.url}")
        String avatar,
        @NotEmpty(message = "{createClient.email.notempty}")
        @Email(message = "{createClient.email}")
        String email,
        String telefono,
        String pin

) {
}
