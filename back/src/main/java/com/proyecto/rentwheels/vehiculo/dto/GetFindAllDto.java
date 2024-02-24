package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetFindAllDto(

        String combustion,
        GetModeloDto modelo,
        String imagen,
        String transmision
//        GetTipoVehiculosDTO tipoVehiculosdto
) {

    public static GetFindAllDto of(Vehiculo v){

        return new GetFindAllDto(
                v.getCombustible(),
                GetModeloDto.of(v.getModelo()),
                v.getImagen(),
                v.getTransmision()
//                GetTipoVehiculosDTO.of(v.getTipoVehiculo())
        );
    }
}
