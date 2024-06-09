package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;

public record EditVehiculoDto(

        String id,
        String combustion,
        String modelo,
        String imagen,
        String transmision,
        @Min(value = 2, message = "{editVehiculoDto.capacidadPasajeros.min}")
        @Max(value = 10, message = "{editVehiculoDto.capacidadPasajeros.max}")
        int capacidadPasajeros,
        @Min(value = 10000, message = "{editVehiculoDto.autonomia.min}")
        @Max(value = 30000, message = "{editVehiculoDto.autonomia.max}")
        int autonomia,
        @Min(value = 90, message = "{editVehiculoDto.potencia.min}")
        @Max(value = 300, message = "{editVehiculoDto.potencia.max}")
        int potencia,
        String estado,
        @Min(value = 2, message = "{editVehiculoDto.numPuertas.min}")
        @Max(value = 5, message = "{editVehiculoDto.numPuertas.max}")
        int numPuertas,
        boolean disponible,
        @Min(value = 80, message = "{editVehiculoDto.precioBase.min}")
        double precioBase
) {
}
