package com.proyecto.rentwheels.vehiculo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.net.URI;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class EmptyVehiculosListException extends ErrorResponseException {

    public EmptyVehiculosListException (){

        super(HttpStatus.NOT_FOUND, of("La lista de vehículos está vacía"), null);
    }


    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, message);
        problemDetail.setTitle("Lista de vehículos vacía");
        problemDetail.setProperty("entityType", "Vehiculos");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault()).format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
