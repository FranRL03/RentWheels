package com.proyecto.foodhub.usuario.exception;

public class EmptyClienteListException extends RuntimeException{
    public EmptyClienteListException(){
        super("No clients were found");
    }

}
