package com.proyecto.rentwheels.alquiler.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class InvalidDateException extends ErrorResponseException {

    public InvalidDateException () {
        super (HttpStatus.BAD_REQUEST, of("La fecha de inicio no puede ser posterior a la fecha fin/actual"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, message);
        problemDetail.setTitle("Fechas no válidas");
        problemDetail.setProperty("entityType", "Alquiler");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
