package com.proyecto.rentwheels.alquiler.dto;

import java.time.LocalDate;

public record CreateAlquilerDto(

        double precio,
        int kilometrosAnos,
        LocalDate fechaFin
) {
}
