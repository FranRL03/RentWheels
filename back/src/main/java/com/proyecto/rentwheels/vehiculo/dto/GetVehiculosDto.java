package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetVehiculosDto(
    String imagen,
    String combustion,
    boolean disponible
){

    public static GetVehiculosDto of (Vehiculo v){
        return new GetVehiculosDto(
                v.getImagen(),
                v.getCombustible(),
                v.isDisponible()
        );
    }
}
