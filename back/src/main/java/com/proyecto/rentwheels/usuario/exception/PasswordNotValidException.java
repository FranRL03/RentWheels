package com.proyecto.rentwheels.usuario.exception;

public class PasswordNotValidException extends RuntimeException{
    public PasswordNotValidException() {
        super("Las contraseñas no coinciden");
    }
}
