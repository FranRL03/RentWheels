package com.proyecto.rentwheels.vehiculo.dto;

import com.fasterxml.jackson.annotation.JsonView;
import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.modelo.jsonview.ModeloView;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;

public record GetFindAllDto(

        String id,
        String combustion,
        GetModeloDto modelo,
        String imagen,
        String transmision,
        int capacidadPasajeros,
        int autonomia,
        int potencia,
        String estado,
        int numPuertas,
        boolean disponible,
        double precioBase
//        GetTipoVehiculosDTO tipoVehiculosdto
) {

    public static GetFindAllDto of(Vehiculo v){

        return new GetFindAllDto(
                v.getId().toString(),
                v.getCombustible(),
                GetModeloDto.of(v.getModelo()),
                v.getImagen(),
                v.getTransmision(),
                v.getCapacidadPasajeros(),
                v.getAutonomia(),
                v.getPotencia(),
                v.getEstado(),
                v.getNumPuertas(),
                v.isDisponible(),
                v.getPrecioBase()
//                GetTipoVehiculosDTO.of(v.getTipoVehiculo())
        );
    }
}
