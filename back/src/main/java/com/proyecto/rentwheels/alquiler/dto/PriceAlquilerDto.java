package com.proyecto.rentwheels.alquiler.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.usuario.dto.GetClienteDetailsDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public record PriceAlquilerDto(

        double precio,
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
        LocalDate fechaCreacion
) {

    public static PriceAlquilerDto of (Alquiler a){
        return new PriceAlquilerDto(
                a.getPrecio(),
                a.getFechaCreacion()
        );
    }
}
