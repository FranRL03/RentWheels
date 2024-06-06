package com.proyecto.rentwheels.modelo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class DeleteModeloException extends ErrorResponseException {

    public DeleteModeloException (){

        super(HttpStatus.BAD_REQUEST, of("No se puede borrar este modelo mientras tenga vehiculos asignados"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, message);
        problemDetail.setTitle("Borrado de modelo denegado");
        problemDetail.setProperty("entityType", "Modelo");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
