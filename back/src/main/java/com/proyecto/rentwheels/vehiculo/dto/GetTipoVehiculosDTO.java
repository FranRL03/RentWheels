package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.vehiculo.model.TipoVehiculo;

public record GetTipoVehiculosDTO(

        String id,
        String tipo
) {

    public static GetTipoVehiculosDTO of (TipoVehiculo t){

        return new GetTipoVehiculosDTO(
                t.getId().toString(),
                t.getTipo()
        );
    }
}
