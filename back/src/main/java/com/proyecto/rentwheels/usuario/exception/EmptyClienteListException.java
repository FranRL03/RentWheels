package com.proyecto.rentwheels.usuario.exception;

public class EmptyClienteListException extends RuntimeException{
    public EmptyClienteListException(){
        super("No clients were found");
    }

}
