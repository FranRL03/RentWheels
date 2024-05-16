package com.proyecto.rentwheels.alquiler.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record CreateAlquilerDto(

        int kilometrosAnos,
        LocalDate fechaInicio,
        LocalDate fechaFin,
        String origen,
        String destino,
        double precio
) {
}
