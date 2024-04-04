package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record EditVehiculoDto(

        String id,
        String combustion,
        String modelo,
        String imagen,
        String transmision,
        int capacidadPasajeros,
        int autonomia,
        int potencia,
        String estado,
        int numPuertas,
        boolean disponible,
        double precioBase
) {
}
