package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetFindAllDto(

        String combustion,
        String modelo,
        String imagen,
        String transmision
//        GetTipoVehiculosDTO tipoVehiculosdto
) {

    public static GetFindAllDto of(Vehiculo v){

        return new GetFindAllDto(
                v.getCombustible(),
                v.getModelo(),
                v.getImagen(),
                v.getTransmision()
//                GetTipoVehiculosDTO.of(v.getTipoVehiculo())
        );
    }
}
