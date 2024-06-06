package com.proyecto.rentwheels.alquiler.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class EmptyAlquilerException extends ErrorResponseException {

    public EmptyAlquilerException () {

        super(HttpStatus.NOT_FOUND, of("No hay alquileres"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, message);
        problemDetail.setTitle("Lista de alquileres vacía");
        problemDetail.setProperty("entityType", "Alquiler");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
