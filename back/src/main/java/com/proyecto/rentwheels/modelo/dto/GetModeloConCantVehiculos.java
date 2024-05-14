package com.proyecto.rentwheels.modelo.dto;

import com.proyecto.rentwheels.modelo.model.Modelo;

public record GetModeloConCantVehiculos(

        String id,
        String logo,
        String modelo,
        int cantVehiculos
) {

    public static GetModeloConCantVehiculos of (Modelo m, int cantVehiculos){
        return new GetModeloConCantVehiculos(
                m.getId().toString(),
                m.getLogo(),
                m.getModelo(),
                cantVehiculos
        );
    }
}
