package com.proyecto.rentwheels.alquiler.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class InsufficientFundsException extends ErrorResponseException {

    public InsufficientFundsException () {
        super(HttpStatus.BAD_REQUEST, of("Dinero insuficiente, por favor inserte dinero"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, message);
        problemDetail.setTitle("Dinero insuficiente");
        problemDetail.setProperty("entityType", "Alquiler");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
