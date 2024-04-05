package com.proyecto.rentwheels.modelo.exception;

public class NotFoundModeloException extends RuntimeException{

    public NotFoundModeloException() {
        super("El modelo de coche no se ha encontrado");
    }
}
