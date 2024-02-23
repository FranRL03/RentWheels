package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetFindAllDto(

        String marca,
        String modelo,
        String imagen,
        double precio,
        GetTipoVehiculosDTO tipoVehiculosdto
) {

    public static GetFindAllDto of(Vehiculo v){

        return new GetFindAllDto(
                v.getMarca(),
                v.getModelo(),
                v.getImagen(),
                v.getPrecio(),
                GetTipoVehiculosDTO.of(v.getTipoVehiculo())
        );
    }
}
