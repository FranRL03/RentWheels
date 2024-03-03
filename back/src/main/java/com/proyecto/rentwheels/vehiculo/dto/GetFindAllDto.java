package com.proyecto.rentwheels.vehiculo.dto;

import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetFindAllDto(

        String combustion,
        GetModeloDto modelo,
        String imagen,
        String transmision,
        int capacidadPasajeros,
        int autonomia,
        int potencia,
        String estado,
        int numPuertas,
        boolean disponible
//        GetTipoVehiculosDTO tipoVehiculosdto
) {

    public static GetFindAllDto of(Vehiculo v){

        return new GetFindAllDto(
                v.getCombustible(),
                GetModeloDto.of(v.getModelo()),
                v.getImagen(),
                v.getTransmision(),
                v.getCapacidadPasajeros(),
                v.getAutonomia(),
                v.getPotencia(),
                v.getEstado(),
                v.getNumPuertas(),
                v.isDisponible()
//                GetTipoVehiculosDTO.of(v.getTipoVehiculo())
        );
    }
}
