package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetVehiculosDto(
    String id,
    String imagen,
    String modelo,
    String combustion,
    String transmision,
    boolean disponible,
    double precioBase
){

    public static GetVehiculosDto of (Vehiculo v){
        return new GetVehiculosDto(
                v.getId().toString(),
                v.getImagen(),
                v.getModelo().getModelo(),
                v.getCombustible(),
                v.getTransmision(),
                v.isDisponible(),
                v.getPrecioBase()
        );
    }
}
