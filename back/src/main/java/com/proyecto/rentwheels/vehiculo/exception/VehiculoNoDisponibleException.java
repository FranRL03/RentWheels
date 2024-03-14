package com.proyecto.rentwheels.vehiculo.exception;

public class VehiculoNoDisponibleException extends RuntimeException{

    public VehiculoNoDisponibleException () {
        super ("El vehículo ya está alquilado");
    }
}
