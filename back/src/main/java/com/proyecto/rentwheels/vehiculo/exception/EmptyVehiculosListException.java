package com.proyecto.rentwheels.vehiculo.exception;

public class EmptyVehiculosListException extends RuntimeException{

    public EmptyVehiculosListException (){
        super("La lista de vehículos está vacía");
    }
}
