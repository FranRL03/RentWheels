package com.proyecto.rentwheels.vehiculo.exception;

public class VehiculoNoDisponibleException extends RuntimeException{

    public VehiculoNoDisponibleException () {
        super ("Operación cancelada: El vehículo está alquilado");
    }
}
