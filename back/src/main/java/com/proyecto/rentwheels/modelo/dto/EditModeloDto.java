package com.proyecto.rentwheels.modelo.dto;

import jakarta.validation.constraints.NotEmpty;

public record EditModeloDto (

        @NotEmpty(message = "{editModeloDto.modelo.notempty}")
        String modelo,
//        @NotEmpty(message = "{editModeloDto.logo.notempty}")
        String logo
){
}
