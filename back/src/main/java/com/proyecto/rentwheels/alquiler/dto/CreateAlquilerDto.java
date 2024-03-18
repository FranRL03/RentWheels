package com.proyecto.rentwheels.alquiler.dto;

import java.time.LocalDate;

public record CreateAlquilerDto(

        int kilometrosAnos,
        LocalDate fechaInicio,
        LocalDate fechaFin
) {
}
