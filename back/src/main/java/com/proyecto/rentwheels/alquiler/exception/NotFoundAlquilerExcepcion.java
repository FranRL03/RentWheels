package com.proyecto.rentwheels.alquiler.exception;

public class NotFoundAlquilerExcepcion extends RuntimeException{

    public NotFoundAlquilerExcepcion () {
        super ("El alquiler no se ha encontrado");
    }
}
