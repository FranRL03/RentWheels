package com.proyecto.rentwheels.security.jwt.refresh;


import com.proyecto.rentwheels.security.errorhandling.JwtTokenException;

public class RefreshTokenException extends JwtTokenException {

    public RefreshTokenException(String msg) {
        super(msg);
    }

}


