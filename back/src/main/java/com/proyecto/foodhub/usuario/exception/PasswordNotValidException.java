package com.proyecto.foodhub.usuario.exception;

public class PasswordNotValidException extends RuntimeException{
    public PasswordNotValidException() {
        super("Las contraseñas no coinciden");
    }
}
