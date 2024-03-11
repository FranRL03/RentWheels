package com.proyecto.rentwheels.vehiculo.exception;

public class VehiculoNotFoundException extends RuntimeException{

    public VehiculoNotFoundException (String id) {
        super("El vehículo con el " + id + "no se encuentra");
    }
}
