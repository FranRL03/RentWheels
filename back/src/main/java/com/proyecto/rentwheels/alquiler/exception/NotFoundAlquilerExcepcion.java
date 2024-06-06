package com.proyecto.rentwheels.alquiler.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class NotFoundAlquilerExcepcion extends ErrorResponseException {

    public NotFoundAlquilerExcepcion () {
        super (HttpStatus.NOT_FOUND, of("El alquiler no se ha encontrado"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, message);
        problemDetail.setTitle("Alquiler no encontrado");
        problemDetail.setProperty("entityType", "Alquiler");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
