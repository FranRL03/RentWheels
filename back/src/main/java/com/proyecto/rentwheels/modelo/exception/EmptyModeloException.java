package com.proyecto.rentwheels.modelo.exception;

public class EmptyModeloException extends RuntimeException{

    public EmptyModeloException () {
        super("La lista de modelos esta vacia");
    }

}
