package com.proyecto.rentwheels.alquiler.exception;

public class EmptyAlquilerException extends RuntimeException{

    public EmptyAlquilerException () {

        super("No hay alquileres");
    }
}
