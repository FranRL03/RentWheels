package com.proyecto.rentwheels.vehiculo.exception;

public class VehiculoNoDisponibleException extends RuntimeException{

    public VehiculoNoDisponibleException () {
        super ("Operación cancelada: El vehículo tiene alquileres asociados o no está disponible");
    }
}
