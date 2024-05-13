package com.proyecto.rentwheels.modelo.exception;

public class DeleteModeloException extends RuntimeException{

    public DeleteModeloException (){

        super("No se puede borrar este modelo mientras tenga vehiculos");
    }
}
